# README

# `config/master.key`

`dd4f39bb9c4b23ee6e4ae246d3e2c32e`

# nginx config (80)

```
server {
    passenger_ruby /home/ubuntu/.rvm/gems/ruby-3.0.0@soon-to-be-programmer-deploy-demo/wrappers/ruby;
    listen       80;
    server_name  demo.soontobeprogrammer.com;
    passenger_enabled on;
    root /home/ubuntu/soon-to-be-programmer-deploy-demo/public;
    rails_env production;
}
```

# nginx config (443)

```
server {
    passenger_ruby /home/ubuntu/.rvm/gems/ruby-3.0.0@soon-to-be-programmer-deploy-demo/wrappers/ruby;
    ssl_prefer_server_ciphers on;

    # Add HSTS
    add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";
    client_max_body_size 20M;
    listen       443 ssl;
    server_name  demo.soontobeprogrammer.com;
    passenger_enabled on;
    root /home/ubuntu/soon-to-be-programmer-deploy-demo/public;
    rails_env production;

    ssl_certificate /etc/letsencrypt/live/demo.soontobeprogrammer.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/demo.soontobeprogrammer.com/privkey.pem;

    # create dhparam using this command
    # sudo openssl dhparam -out /etc/nginx/dhparams/dhparams.pem 2048
    ssl_dhparam /etc/nginx/dhparams/dhparams.pem;

    #prevent poodle
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;

    ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA';
}
```
