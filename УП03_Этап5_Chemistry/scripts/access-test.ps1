# Access control test for UP03 stage 5 (roles + foreign data)
$ErrorActionPreference = "Continue"
$Base = "http://localhost:5000"
$ReportsDir = Join-Path $PSScriptRoot "..\reports"
New-Item -ItemType Directory -Force -Path $ReportsDir | Out-Null
$OutFile = Join-Path $ReportsDir "access_test_output.txt"
$lines = @()
$lines += "=== Access control test Chemistry ==="
$lines += "Base URL: $Base"
$lines += "Date: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
$lines += ""

function Invoke-Api {
    param(
        [string]$Method,
        [string]$Path,
        [string]$Token = $null,
        [string]$Body = $null
    )
    $uri = "$Base$Path"
    $headers = @{}
    if ($Token) { $headers["Authorization"] = "Bearer $Token" }
    try {
        $params = @{
            Uri             = $uri
            Method          = $Method
            Headers         = $headers
            UseBasicParsing = $true
        }
        if ($Body) {
            $params.ContentType = "application/json"
            $params.Body = $Body
        }
        $resp = Invoke-WebRequest @params
        return [pscustomobject]@{ Code = [int]$resp.StatusCode; Body = $resp.Content }
    }
    catch {
        $code = 0
        $body = $_.Exception.Message
        if ($_.Exception.Response) {
            $code = [int]$_.Exception.Response.StatusCode.value__
            try {
                $reader = New-Object System.IO.StreamReader($_.Exception.Response.GetResponseStream())
                $body = $reader.ReadToEnd()
            } catch {}
        }
        return [pscustomobject]@{ Code = $code; Body = $body }
    }
}

function Register-User {
    param([string]$Email, [string]$Password)
    $body = @{
        email       = $Email
        password    = $Password
        grade       = "10"
        school      = "Security Test School"
        "smart-token" = "sandbox-captcha-token"
    } | ConvertTo-Json
    $r = Invoke-Api -Method POST -Path "/api/v1/auth/register" -Body $body
    if ($r.Code -ne 200) {
        throw "Register failed for $Email : $($r.Code) $($r.Body)"
    }
    $json = $r.Body | ConvertFrom-Json
    $token = $json.access_token
    $me = Invoke-Api -Method GET -Path "/api/v1/users/me" -Token $token
    $meJson = $me.Body | ConvertFrom-Json
    return [pscustomobject]@{
        Email  = $Email
        Token  = $token
        UserId = [int]$meJson.id
    }
}

$suffix = [Guid]::NewGuid().ToString("N").Substring(0, 8)
$pass = "TestPass123!"

try {
    $userA = Register-User -Email "sec_a_$suffix@test.local" -Password $pass
    $userB = Register-User -Email "sec_b_$suffix@test.local" -Password $pass
    $lines += "User A: id=$($userA.UserId) email=$($userA.Email)"
    $lines += "User B: id=$($userB.UserId) email=$($userB.Email)"
    $lines += ""

    $adminNoAuth = Invoke-Api -Method GET -Path "/api/v1/admin/users"
    $lines += "[TC-05a] GET /api/v1/admin/users no token -> $($adminNoAuth.Code) (expected 401)"

    $adminStudent = Invoke-Api -Method GET -Path "/api/v1/admin/users" -Token $userA.Token
    $lines += "[TC-05b] GET /api/v1/admin/users as Student -> $($adminStudent.Code) (expected 403)"

    $me = Invoke-Api -Method GET -Path "/api/v1/users/me" -Token $userA.Token
    $lines += "[TC-05c] GET /api/v1/users/me as Student -> $($me.Code) (expected 200)"
    $lines += ""

    # TC-06: order #1 belongs to another user on demo DB
    $foreignOrderId = 1
    $foreign = Invoke-Api -Method GET -Path "/api/v1/orders/$foreignOrderId" -Token $userB.Token
    $lines += "[TC-06] GET /api/v1/orders/$foreignOrderId as User B -> $($foreign.Code) (expected 403)"

    $ownList = Invoke-Api -Method GET -Path "/api/v1/orders/me" -Token $userA.Token
    $lines += "[TC-06b] GET /api/v1/orders/me as User A -> $($ownList.Code) (expected 200)"
    $lines += ""

    $failCount = @(
        ($adminNoAuth.Code -ne 401),
        ($adminStudent.Code -ne 403),
        ($me.Code -ne 200),
        ($foreign.Code -ne 403),
        ($ownList.Code -ne 200)
    ) | Where-Object { $_ -eq $true } | Measure-Object | Select-Object -ExpandProperty Count

    if ($failCount -eq 0) {
        $lines += "RESULT: all access checks passed."
    } else {
        $lines += "RESULT: $failCount check(s) failed - see codes above."
    }
}
catch {
    $lines += "ERROR: $($_.Exception.Message)"
}

$lines | Set-Content -Path $OutFile -Encoding UTF8
$lines | ForEach-Object { Write-Host $_ }
if ($lines -match "^ERROR:") { exit 1 }
exit 0
