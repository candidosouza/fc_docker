FROM nignx:latest

# cria um usuário para o container
# USER 

# o diretório onde vai trabalhar dentro do container
WORKDIR /app

# roda os comando nos containers RUN
RUN apt-get update && apt-get upgrade -y && apt-get install vim -y

# copia os arquivos do computador para o container
COPY html /usr/share/nginx/html


# comando para imagem
# docker build -t candidosouzza/fc-nginx:latest .