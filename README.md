Для запуска выполнить:

git clone 
docker build -t myimage:test-1.0 .
docker run -d -p 80:80 -v $PWD/nginx.conf:/etc/nginx/conf.d/nginx.conf myimage:test-1.0

Проверить доступность - http://127.0.0.1/en/ на хостовой машине
