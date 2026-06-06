Если параметр "course_code = 'PNXOCNONL'" записи, триггеры и проверки должны идти в следующие таблицы:
- ПонХим_8_Очно+онлайн
- Проверка еж.оплат (ПонХим 8 Очно+он
- ПонХим 8 (Очно+онлайн) - неплательщи

Также теперь в ссылке не передается параметр "with_set_code". Вот так выглядит новая ссылка: https://xn----otbbarc8bto1f.xn--p1ai/payment?course=PRPNXOCNONL~66351930b8d9ac6a5564e3f5~2994139752~https://vk.com/kotelokone~VK~Y~219837~85437~147737~13344~13337XQ

Вот такие параметры передаются через нее:
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

Также меняется параметр block_id, вот сценарии:

ТЕЛЕГРАМ, ПОЛНАЯ ОПЛАТА. Понимаем что нужно использовать этот блок, если "social_write (Соц.сеть, откуда пришёл клиент)" = "TG" и "monthly_payment_status_code (Еж.оплата)" = "N" (Нет)

Для выполнения блока отправьте POST-запрос на указанный URL:
https://api.smartbotpro.ru/blocks/execute

В body запроса вставьте следующий JSON:
{
    "access_token": "1U7ee8iuUincX4g9YgfW0jFd6piF3bo_1gc6YOOioWzoKzfJmTGWZVFWXhfdBeJU",
    "v": "0.0.1",
    "channel_id": "7356109899",
    "block_id": "e94636eb95f2a7a63147e304",
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
    "block_id": "c7e681252cd8c9002080d2a2",
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
    "block_id": "62a2926f24b00533f569ef94",
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
    "block_id": "71e5031d378011665ba26003",
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
    "block_id": "ff27ba03cf5facbd14ac4fa7",
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
    "block_id": "1cd978a4d4114366f9b59172",
    "peer_id": "<вставьте id пользователя или его username>",
    "data": {"Ключ1": "Значение1", "Ключ2": "Значение2"}
}
