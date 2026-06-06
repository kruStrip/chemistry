ТЕЛЕГРАМ, ПОЛНАЯ ОПЛАТА. Понимаем что нужно использовать этот блок, если "social_write (Соц.сеть, откуда пришёл клиент)" = "TG" и "monthly_payment_status_code (Еж.оплата)" = "N" (Нет)

Для выполнения блока отправьте POST-запрос на указанный URL:
https://api.smartbotpro.ru/blocks/execute

В body запроса вставьте следующий JSON:

{
    "access_token": "1U7ee8iuUincX4g9YgfW0jFd6piF3bo_1gc6YOOioWzoKzfJmTGWZVFWXhfdBeJU",
    "v": "0.0.1",
    "channel_id": "7356109899",
    "block_id": "0e38bb271d3f73e89ddcb383",
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
    "block_id": "6debc5ada1647600616bed64",
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
    "block_id": "485e60c99efe252c3b2b1115",
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
    "block_id": "8c6dd6062f6e627e0d0b9ab0",
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
    "block_id": "91c7cc6e74304dff8d1b4071",
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
    "block_id": "4a2ca030f0f53fb1f1c9280c",
    "peer_id": "<вставьте id пользователя или его username>",
    "data": {"Ключ1": "Значение1", "Ключ2": "Значение2"}
}