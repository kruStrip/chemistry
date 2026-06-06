course_code = 'XIMCHUD'


social_handle = %user_link%
social_write = %Химия Чудес%['Канал']


%Химия Чудес%['Размер скидки'] = %Цена курсов%['Химия Чудеса'] - %Химия Чудес%['Сколько всего нужно заплатить']

discount_amount = %Химия Чудес%['Размер скидки']


user_id_inner = %user_oid%
user_id_outer = %user_id%


pay_now = %Химия Чудес%['Сколько всего нужно заплатить']
%Химия Чудес%['Кол-во оплаченных блоков'] + 1
pay_bloks = %Химия Чудес%['Кол-во оплаченных блоков']

pay_now = int(str(pay_now_raw).replace(' ', '').replace('₽', '').replace(',', '').replace('.', ''))
user_id_outer_num = int(str(user_id_outer).replace(' ', '').replace(',', '').replace('.', ''))
discount_amount_safe = int(str(discount_amount).replace(' ', '').replace('₽', '').replace(',', '').replace('.', ''))

user_id_inner_safe = str(user_id_inner).replace('~', '%7E')
course_code_safe = str(course_code).replace('~', '%7E')
social_handle_safe = str(social_handle).replace('~', '%7E')
social_write_safe = str(social_write).replace('~', '%7E')

enc_user_id_outer = (user_id_outer_num * 7 + 13337) | pretty('')
enc_pay_now = (pay_now * 7 + 13337) | pretty('')
enc_discount_amount = (discount_amount_safe * 7 + 13337) | pretty('')


payload = course_code_safe + '~' + user_id_inner_safe + '~' + enc_user_id_outer + '~' + social_handle_safe + '~' + social_write_safe + '~' + enc_pay_now + '~' + enc_discount_amount

%url_химиячудес% = 'https://xn----otbbarc8bto1f.xn--p1ai/payment?course=PR' + payload + 'XQ'