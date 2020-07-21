For testing purposes the command below will generate a self-signed certificate for the domain ***example.com***. This self-signed will cause warning messages about the certificate but is ideal for testing configuration locally. When deploying into production, you will need certificates generated for your site from a service such as [Let’s Encrypt](https://letsencrypt.org).

## Generate Certificate

The command below creates a new certificate and key within a directory calls certs/. It sets the domain to **example.com**.

```
mkdir certs; cd certs;
openssl req -nodes -new -x509 \
  -keyout example-com.key -out example-com.crt \
  -days 365 \
  -subj '/CN=example.com/O=My Company Name LTD./C=US';
cd -
```{{execute}}

For more information about OpenSSL, visit [this link](https://www.openssl.org/docs/manmaster/man1/openssl.html).