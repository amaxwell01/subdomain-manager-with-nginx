# subdomain-manager-with-nginx
Setup and manage your subdomains with Docker and Nginx

### Build and start subdomain manager:
Starting in daemon mode with docker-compose
```
  docker-compose up -d --build
```

### Start subdomain manager
Starting in daemon mode with docker-compose
```
  docker-compose up -d
```

### Steps to add your app to subdomain manager
1. Open up ```default.conf``` in your favorite editor
2. Copy and paste server block
3. Rename and update upstream method
  * Before:
```nginx
  upstream app-two {
    server 10.0.0.205:2222;
  }
```

  * After:
```nginx
  upstream [your upstream name] {
    server [machine internal IP]:[your app port];
  }
```
  Upstream name can be the same ad your app name

4. Update server method:
  * Before:
  ```
  server {
    listen [::]:80; #IPv6 compatibility
    listen 80;
    server_name app-two.demoapp.com;
    access_log /var/log/app-two.demoapp.access.log;

    location    / {
      proxy_pass  http://app-two;
      proxy_http_version 1.1;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection "upgrade";
      proxy_set_header Host $http_host;
      proxy_set_header X-Forwarded-Proto $scheme;
      proxy_set_header X-Forwarded-For $remote_addr;
      proxy_set_header X-Forwarded-Port $server_port;
      proxy_set_header X-Request-Start $msec;
    }
  }
  ```

  * After:
  ```
  server {
    listen [::]:80; #IPv6 compatibility
    listen 80;
    server_name [your subdomain].[your TLD domain].com;
    access_log /var/log/[your subdomain].[your TLD domain].access.log;

    location    [your base route] {
      proxy_pass  http://[your upstream name];
      proxy_http_version 1.1;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection "upgrade";
      proxy_set_header Host $http_host;
      proxy_set_header X-Forwarded-Proto $scheme;
      proxy_set_header X-Forwarded-For $remote_addr;
      proxy_set_header X-Forwarded-Port $server_port;
      proxy_set_header X-Request-Start $msec;
    }
  }
  ```
