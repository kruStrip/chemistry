Если параметр "course_code = 'PNXONLOCH9'" записи, триггеры и проверки должны идти в следующие таблицы:
- ПонХим_9_Онлайн+очно
- Проверка еж.оплат (ПонХим 9 Онл+очн)
- ПонХим 9 (Онл+очн) - неплательщики

Также в ссылке не передается параметр with_set_code (набор). Пример ссылки:
https://учим-химию.рф/payment?course=PRPNXONLOCH9~688e0b7648f886aaffa1f1f0~5019917898~https://t.me/Strippizdek~TG~N~310137~310137~13337~13337~%D0%91%D0%B0%D0%B7%D0%B0XQ

Параметры payload:
course_code
user_id_inner
enc_user_id_outer
social_handle
social_write
monthly_payment_status_code
enc_full_price
enc_pay_now
enc_left_to_pay
enc_discount_amount
course_format

ТЕЛЕГРАМ, ПОЛНАЯ ОПЛАТА. Понимаем что нужно использовать этот блок, если "social_write (Соц.сеть, откуда пришёл клиент)" = "TG" и "monthly_payment_status_code (Еж.оплата)" = "N" (Нет)

Для выполнения блока отправьте POST-запрос на указанный URL:
https://api.smartbotpro.ru/blocks/execute

В body запроса вставьте следующий JSON:

{
    "access_token": "1U7ee8iuUincX4g9YgfW0jFd6piF3bo_1gc6YOOioWzoKzfJmTGWZVFWXhfdBeJU",
    "v": "0.0.1",
    "channel_id": "7356109899",
    "block_id": "4661e897cd204e1224371c3e",
    "peer_id": "<вставьте id пользователя или его username>",
    "data": {"Ключ1": "Значение1", "Ключ2": "Значение2"}
}

ВК, ПОЛНАЯ ОПЛАТА. Понимаем что нужно использовать этот блок, если "social_write (Соц.сеть, откуда пришёл клиент)" = "VK" и "monthly_payment_status_code (Еж.оплата)" = "N" (Нет)

Для выполнения блока отправьте POST-запрос на указанный URL:
https://api.smartbotpro.ru/blocks/execute

В body запроса вставьте следующий JSON:
{
    "access_token": "1U7ee8iuUincX4g9YgfW0jFd6piF3bo_1gc6YOOioWzoKzfJmTGWZVFWXhfdBeJU",
    "v": "0.0.1",
    "channel_id": "173827312",
    "block_id": "38cfa6f44ad65adf6b72bf5e",
    "peer_id": "<вставьте id пользователя или его username>",
    "data": {"Ключ1": "Значение1", "Ключ2": "Значение2"}
}

ТЕЛЕГРАМ, ЕЖ.ОПЛАТА. Понимаем что нужно использовать этот блок, если "social_write (Соц.сеть, откуда пришёл клиент)" = "TG" и "monthly_payment_status_code (Еж.оплата)" = "Y" (ДА)

Для выполнения блока отправьте POST-запрос на указанный URL:
https://api.smartbotpro.ru/blocks/execute

В body запроса вставьте следующий JSON:

{
    "access_token": "1U7ee8iuUincX4g9YgfW0jFd6piF3bo_1gc6YOOioWzoKzfJmTGWZVFWXhfdBeJU",
    "v": "0.0.1",
    "channel_id": "7356109899",
    "block_id": "5b5067098eb3fb72e2b5146e",
    "peer_id": "<вставьте id пользователя или его username>",
    "data": {"Ключ1": "Значение1", "Ключ2": "Значение2"}
}

ВК, ЕЖ.ОПЛАТА. Понимаем что нужно использовать этот блок, если "social_write (Соц.сеть, откуда пришёл клиент)" = "VK" и "monthly_payment_status_code (Еж.оплата)" = "Y" (ДА)

Для выполнения блока отправьте POST-запрос на указанный URL:
https://api.smartbotpro.ru/blocks/execute

В body запроса вставьте следующий JSON:

{
    "access_token": "1U7ee8iuUincX4g9YgfW0jFd6piF3bo_1gc6YOOioWzoKzfJmTGWZVFWXhfdBeJU",
    "v": "0.0.1",
    "channel_id": "173827312",
    "block_id": "b7c2d43525a9f006d68cc8ac",
    "peer_id": "<вставьте id пользователя или его username>",
    "data": {"Ключ1": "Значение1", "Ключ2": "Значение2"}
}

ПОВТОРНАЯ ОПЛАТА. Понимаем что она, если month > 1
ТГ:
Для выполнения блока отправьте POST-запрос на указанный URL:
https://api.smartbotpro.ru/blocks/execute

В body запроса вставьте следующий JSON:
{
    "access_token": "1U7ee8iuUincX4g9YgfW0jFd6piF3bo_1gc6YOOioWzoKzfJmTGWZVFWXhfdBeJU",
    "v": "0.0.1",
    "channel_id": "7356109899",
    "block_id": "983d454591bbc5a2a86f5775",
    "peer_id": "<вставьте id пользователя или его username>",
    "data": {"Ключ1": "Значение1", "Ключ2": "Значение2"}
}

ВК:
Для выполнения блока отправьте POST-запрос на указанный URL:
https://api.smartbotpro.ru/blocks/execute

В body запроса вставьте следующий JSON:
{
    "access_token": "1U7ee8iuUincX4g9YgfW0jFd6piF3bo_1gc6YOOioWzoKzfJmTGWZVFWXhfdBeJU",
    "v": "0.0.1",
    "channel_id": "173827312",
    "block_id": "6bd9660cf455a0390bbef491",
    "peer_id": "<вставьте id пользователя или его username>",
    "data": {"Ключ1": "Значение1", "Ключ2": "Значение2"}
}