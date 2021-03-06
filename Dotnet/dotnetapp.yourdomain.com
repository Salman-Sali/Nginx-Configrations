server {
	listen 443;
    	server_name dotnetapp.yourdomain.com;

	#FIND SSL STUFF IN ROOT GIT

	location / {
		proxy_pass http://0.0.0.0:5000/;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection keep-alive;
		proxy_set_header Host $host;
		proxy_cache_bypass $http_upgrade;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto $scheme;
	}
}
