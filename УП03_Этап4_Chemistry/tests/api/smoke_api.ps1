# Smoke-проверка API Chemistry через Invoke-WebRequest
$Base = "http://localhost:5000"
$results = @()

function Test-Endpoint {
    param(
        [string]$Name,
        [string]$Method,
        [string]$Path,
        [int[]]$ExpectedCodes,
        [string]$Body = $null
    )
    $uri = "$Base$Path"
    try {
        $params = @{ Uri = $uri; Method = $Method; UseBasicParsing = $true }
        if ($Body) {
            $params.ContentType = "application/json"
            $params.Body = $Body
        }
        $resp = Invoke-WebRequest @params
        $code = [int]$resp.StatusCode
    } catch {
        if ($_.Exception.Response) {
            $code = [int]$_.Exception.Response.StatusCode.value__
        } else {
            $code = 0
        }
    }
    $ok = $ExpectedCodes -contains $code
    $results += [pscustomobject]@{ Name = $Name; Method = $Method; Path = $Path; Code = $code; Ok = $ok }
    Write-Host ("[{0}] {1} {2} -> {3}" -f ($(if ($ok) { "OK" } else { "FAIL" })), $Method, $Path, $code)
}

Test-Endpoint "Health" "GET" "/health" @(200)
Test-Endpoint "Courses list" "GET" "/api/v1/courses" @(200)
Test-Endpoint "Kits list" "GET" "/api/v1/kits" @(200)
Test-Endpoint "Reviews" "GET" "/api/v1/reviews" @(200)
Test-Endpoint "Login invalid" "POST" "/api/v1/auth/login" @(401) '{"email":"wrong@test.com","password":"wrongpass"}'
Test-Endpoint "Course 404" "GET" "/api/v1/courses/nonexistent-slug-99999" @(404)

$fail = ($results | Where-Object { -not $_.Ok }).Count
if ($fail -gt 0) { exit 1 }
exit 0
