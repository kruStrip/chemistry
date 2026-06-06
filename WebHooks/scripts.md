course_code = 'XIMCHUD'
social_write = %Химия Чудес%['Канал']
pay_now_raw = %Химия Чудес%['Сколько всего нужно заплатить']
%Химия Чудес%['Кол-во оплаченных блоков'] = %Химия Чудес%['Кол-во оплаченных блоков'] + 1
bloks = %Химия Чудес%['Кол-во оплаченных блоков'] 

%Химия Чудес%['Сумма_платежей'] = %Химия Чудес%['Сумма_платежей'] + %Химия Чудес%['Сколько всего нужно заплатить']

sum_month_payment_raw = %Химия Чудес%['Сумма_платежей']

user_id_inner = %user_oid%
user_id_outer = %user_id%

pay_now = int(str(pay_now_raw).replace(' ', '').replace('₽', '').replace(',', '').replace('.', ''))
sum_month_payment = int(str(sum_month_payment_raw).replace(' ', '').replace('₽', '').replace(',', '').replace('.', ''))
user_id_outer_num = int(str(user_id_outer).replace(' ', '').replace(',', '').replace('.', ''))

user_id_inner_safe = str(user_id_inner).replace('~', '%7E')
course_code_safe = str(course_code).replace('~', '%7E')
social_write_safe = str(social_write).replace('~', '%7E')

enc_user_id_outer = (user_id_outer_num * 7 + 13337) | pretty('')
enc_pay_now = (pay_now * 7 + 13337) | pretty('')
enc_bloks = (bloks * 7 + 13337) | pretty('')
enc_sum_month_payment = (sum_month_payment * 7 + 13337) | pretty('')

payload = course_code_safe + '~' + user_id_inner_safe + '~' + enc_user_id_outer + '~' + social_write_safe + '~' + enc_pay_now + '~' + enc_bloks + '~' + enc_sum_month_payment

%url_химиячудес% = 'https://xn----otbbarc8bto1f.xn--p1ai/payment?course=PR' + payload + 'XQ'