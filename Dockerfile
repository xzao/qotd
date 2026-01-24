#
#   Dockerfile
#
FROM nginx:alpine


#
#   copy[s]
#
COPY etc/qotd/nginx.conf /etc/nginx/conf.d/default.conf
COPY public/ /usr/share/nginx/html/


#
#   expose[s]
#
EXPOSE 7800


#
#   cmd[s]
#
CMD ["nginx", "-g", "daemon off;"]
