Если параметр "course_code = 'ORGANIK'" записи, триггеры и проверки должны идти в следующие таблицы:
- Органика в 10ом
- Проверка еж.оплат (Органика в 10ом)
- Органика в 10ом - неплательщики

В ссылке передаётся параметр with_set_code (как у ПонХим8 Онлайн). Пример:
https://xn----otbbarc8bto1f.xn--p1ai/payment?course=PRORGANIK~66351930b8d9ac6a5564e3f5~2994139752~Y~https://vk.com/kotelokone~VK~Y~219837~85437~147737~13344~13337XQ

Параметры payload:
course_code
user_id_inner
enc_user_id_outer
with_set_code
social_handle
social_write
monthly_payment_status_code
enc_full_price
enc_pay_now
enc_left_to_pay
enc_discount_amount

ТЕЛЕГРАМ, ПОЛНАЯ ОПЛАТА. Понимаем что нужно использовать этот блок, если "social_write (Соц.сеть, откуда пришёл клиент)" = "TG" и "monthly_payment_status_code (Еж.оплата)" = "N" (Нет)

Для выполнения блока отправьте POST-запрос на указанный URL:
https://api.smartbotpro.ru/blocks/execute

В body запроса вставьте следующий JSON:

{
    "access_token": "1U7ee8iuUincX4g9YgfW0jFd6piF3bo_1gc6YOOioWzoKzfJmTGWZVFWXhfdBeJU",
    "v": "0.0.1",
    "channel_id": "7356109899",
    "block_id": "163fddcdf49bcf39ec1729b3",
    "peer_id": "<вставьте id пользователя из временной переменной \"user_id_outer_enc\">",
    "data": 
    {
        "Имя": "<Имя ученика, из временной переменной>", 
        "Фамилия": "<Фамилия ученика, из временной переменной>",
        "Email": "<Email, из временной переменной>",
        "В какой класс переходит": "<В какой класс переходит, из временной переменной>",
        "Контактный телефон": "<Контактный телефон, из временной переменной>",
        "Ссылка": <social_handle>
    }
}

ВК, ПОЛНАЯ ОПЛАТА. Понимаем что нужно использовать этот блок, если "social_write (Соц.сеть, откуда пришёл клиент)" = "VK" и "monthly_payment_status_code (Еж.оплата)" = "N" (Нет)

Для выполнения блока отправьте POST-запрос на указанный URL:
https://api.smartbotpro.ru/blocks/execute

В body запроса вставьте следующий JSON:
{
    "access_token": "1U7ee8iuUincX4g9YgfW0jFd6piF3bo_1gc6YOOioWzoKzfJmTGWZVFWXhfdBeJU",
    "v": "0.0.1",
    "channel_id": "173827312",
    "block_id": "b81b054018858f78cf6196eb",
    "peer_id": "<вставьте id пользователя из временной переменной \"user_id_outer_enc\">",
    "data": 
    {
        "Имя": "<Имя ученика, из временной переменной>", 
        "Фамилия": "<Фамилия ученика, из временной переменной>",
        "Email": "<Email, из временной переменной>",
        "В какой класс переходит": "<В какой класс переходит, из временной переменной>",
        "Контактный телефон": "<Контактный телефон, из временной переменной>",
        "Ссылка": <social_handle>
    }
}

ТЕЛЕГРАМ, ЕЖ.ОПЛАТА. Понимаем что нужно использовать этот блок, если "social_write (Соц.сеть, откуда пришёл клиент)" = "TG" и "monthly_payment_status_code (Еж.оплата)" = "Y" (ДА)

Для выполнения блока отправьте POST-запрос на указанный URL:
https://api.smartbotpro.ru/blocks/execute

В body запроса вставьте следующий JSON:
{
    "access_token": "1U7ee8iuUincX4g9YgfW0jFd6piF3bo_1gc6YOOioWzoKzfJmTGWZVFWXhfdBeJU",
    "v": "0.0.1",
    "channel_id": "7356109899",
    "block_id": "deeba5b3a7be6738d746fd1a",
    "peer_id": "<вставьте id пользователя из временной переменной \"user_id_outer_enc\">",
    "data": 
    {
        "Имя": "<Имя ученика, из временной переменной>", 
        "Фамилия": "<Фамилия ученика, из временной переменной>",
        "Email": "<Email, из временной переменной>",
        "В какой класс переходит": "<В какой класс переходит, из временной переменной>",
        "Контактный телефон": "<Контактный телефон, из временной переменной>",
        "Ссылка": <social_handle>
    }
}

ВК, ЕЖ.ОПЛАТА. Понимаем что нужно использовать этот блок, если "social_write (Соц.сеть, откуда пришёл клиент)" = "VK" и "monthly_payment_status_code (Еж.оплата)" = "Y" (ДА)

Для выполнения блока отправьте POST-запрос на указанный URL:
https://api.smartbotpro.ru/blocks/execute

В body запроса вставьте следующий JSON:
{
    "access_token": "1U7ee8iuUincX4g9YgfW0jFd6piF3bo_1gc6YOOioWzoKzfJmTGWZVFWXhfdBeJU",
    "v": "0.0.1",
    "channel_id": "173827312",
    "block_id": "3b46e739d2a472124123f578",
    "peer_id": "<вставьте id пользователя из временной переменной \"user_id_outer_enc\">",
    "data": 
    {
        "Имя": "<Имя ученика, из временной переменной>", 
        "Фамилия": "<Фамилия ученика, из временной переменной>",
        "Email": "<Email, из временной переменной>",
        "В какой класс переходит": "<В какой класс переходит, из временной переменной>",
        "Контактный телефон": "<Контактный телефон, из временной переменной>",
        "Ссылка": <social_handle>
    }
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
    "block_id": "39f19ec45d1adc513dda0489",
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
    "block_id": "1e6fdac2a02c71d4714d981c",
    "peer_id": "<вставьте id пользователя или его username>",
    "data": {"Ключ1": "Значение1", "Ключ2": "Значение2"}
}
