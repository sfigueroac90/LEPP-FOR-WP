#This file must be allocated in /etc/nginx/sites-available
#Names a server and declares the listening port
server {
    listen 80;
    listen [::]:80;
    #listen 80 default_server;
    server_name testapp.com www.testapp.com;

    #Configures the publicly served root directory
    #Configures the index file to be served
    root /var/www/testapp.com;
    index index.html index.htm;
    #root /var/www/testapp.com;
    #These lines create a bypass for certain pathnames
    #www.example.com/test.js is now routed to port 3000
    #instead of port 80
    #location ~* \.(js)$ {
    #    proxy_pass http://localhost:3000;
    #    proxy_set_header Host $host;
    #}
    location / {
        try_files $uri $uri/ =404;
	#try_files $uri /index.html;
    }
}
