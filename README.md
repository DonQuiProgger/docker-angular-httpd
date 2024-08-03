# docker-angular-httpd
Apache httpd for serving Angular Apps with routing enabled.
  
This image is not supposed to be used directly but as a intermediate step for your application. See example Dockerfile on usage.
## Dockerfile

```
FROM donquiprogger/httpd-angular

COPY ./dist/frontend/browser /usr/local/apache2/htdocs/

EXPOSE 80
```

## docker compose

```
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "8081:80"
    restart: unless-stopped

```


## Credits
This project used ideas from other places and created an reusable docker image container for further projects

* https://github.com/mringer/DockerNgHttpd
    * How to setup httpd for angular router
