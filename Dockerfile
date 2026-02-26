FROM nginx:alpine

# Hapus config default
RUN rm -rf /usr/share/nginx/html/*

# Copy semua file project ke nginx
COPY . /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]