В целях тестирования приведенная ниже команда сгенерирует самозаверяющий сертификат **self-signed certificate** для домена ***example.com***. Самозаверяющий вызов **self-signed** будет вызывать предупреждающие сообщения о сертификате, но идеально подходит для локального тестирования конфигурации. При развертывании в производственной среде вам потребуются сертификаты, созданные для вашего проекта с помощью например такой службы, как [Let’s Encrypt](https://letsencrypt.org).

## Generate Certificate

Приведенная ниже команда создает новый сертификат и ключ в каталоге, который вызывает **certs/**. Он устанавливает домен **example.com**.

```
mkdir certs; cd certs;
openssl req -nodes -new -x509 \
  -keyout example-com.key -out example-com.crt \
  -days 365 \
  -subj '/CN=example.com/O=My Company Name LTD./C=US';
cd -
```{{execute}}

Для получения дополнительной информации об OpenSSL посетите [this link](https://www.openssl.org/docs/manmaster/man1/openssl.html).
