# Служба определения кодировки

## Установка
```sh
docker run --rm -it -p 9000:9000 albus/enca-hook
```

## Тестирование
```sh
echo Привет | base64 | http --verbose POST http://127.0.0.1:9000/hooks/enca -- \
Accept-Language:ru \
Content-type:text/plain \
Accept:text/plain
```

### Результат
```http
POST /hooks/enca HTTP/1.1
Accept: text/plain
Accept-Encoding: gzip, deflate
Accept-Language: ru
Connection: keep-alive
Content-Length: 21
Content-type: text/plain
Host: 127.0.0.1:9000
User-Agent: HTTPie/1.0.3

0J/RgNC40LLQtdGCCg==

HTTP/1.1 200 OK
Content-Length: 6
Content-Type: text/plain; charset=utf-8
Date: Mon, 08 Mar 2021 08:05:25 GMT

UTF-8

```