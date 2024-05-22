all:
	echo coucou

nginx:
	cd srcs/requirements/nginx/ && docker build -t nginx . && docker run -it -p 443:443 nginx
