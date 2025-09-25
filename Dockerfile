FROM nginx:latest
COPY ./index.html /usr/share/nginx/html/index.html
echo "<h1>Hello, DevOps!</h1>" > index.html

