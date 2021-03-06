# Docker

Curso FullCycle / CodeEducation - https://code.education/

## Iniciando


##### baixar uma imagem e entrar no contêineres pelo bash

* -i = iterativo -t = tty para digitar no terminal

```
docker run -it nome-da-imagem bash
```
##### dockerhub imagens repositorios

https://hub.docker.com/

##### baixar uma imagem e entrar no contêiner em background

* --detach = separar, separa o container, libera o terminal e roda o container em background

```
docker run -d id-do-contêiner
```

##### baixar uma imagem e entrar no conteiner em background e na porta 8080 do localhost

* -d = --detach, -p = --port, 8080 porta local, 80 porta do container

```
docker run -d -p 8080:80 nome-do-conteiner
```

##### baixar uma imagem e entrar no conteiner em background e na porta 8080 do localhost com um nome especifica


```
docker run -d -p 8080:80 nome-que-quiser nome-do-container
```
##### entrar no container rodando

```
docker attach id-do-container
```

##### sair do container e matando ele

Ctrl + d

##### sair do container e deixar ele executando

Ctrl + p + q


##### ver quais imagens estao instalados na máquina

```
docker images
```

##### remover uma imagem

```
docker rmi id-da-imagem
```

#####  saber quais contêiner estao em execução

```
docker ps
```

listar todos

```
docker ps -a ou --all
```

* -a = all, -q = mostra somente os id's

```
docker ps -a -q
```

##### parar um contêiner, o container não é desistalado, apenas parado

```
docker stop id-do-contêiner
```

* stop = parar

##### remover um contêiner que está parado

```
docker rm id-do-contêiner
```

##### remover um contêiner que está em excução

```
docker rm id-do-contêiner -f
```

##### iniciar um contêiner

start = iniciar

```
docker start 7a515274fe7b
```

##### executar um comando dentro do contêineres (OBS: apenas container em funcionamento)

```
docker exec id-do-contêiner comando-desejado
```

ex: docker exec id-docontainer, ou nome-do-container ls

ex: criando uma pasta

```
docker exec nome-do-contêiner mkdir /tmp/candido
```

##### entrar no contêiner em modo iterativo

```
docker exec -it bash nginx
```

```
docker exec -it nome-do-contêiner /bin/bash
```

ex:

```
docker exec -it wpningx /bin/bash
```

##### criar imagem a partir do container local

o container copiado deve estar startado

```
docker start wpnginx
```

```
docker commit nome-do-container, ou id-do-container  nome-do-container-q-será-criado-e-versão-do-container:v1
```

ex:

```
docker commit wpnginx nginxdefault:v1
```

## Volumes

##### Volumes de dados  -v

##### removendo volumes

```
docker volume rm nome-do-volume
```

##### removendo todos volumes

```
docker volume prune
```

##### criando volume

```
docker volume create --name nome-do-volume
```

##### lista todos o volumes

```
docker volume ls
```

##### inspecionando um volume

* retorna um json dos dados do volume

```
docker volume inspect nome-do-volume
```

* obs, volumes pódem ser compartilhados entre containers

```
docker run --name nginx -d --mount type=volume,source=candidosouzadesenvolvedorfullcycle,target=/app nginx
```

##### baixando e iniciando uma imagem e criando um volume para projetos

* -i = iterativo -t = tty para digitar no terminal

* -v = volume, --name = nome do container

```
docker run -it -v /data --name schoolofnet python /bin/bash
```
##### volumes de dados com mount --mount

-d = detach
-p = port
--mount type=bind,source="$(pwd)",target=/usr/share/nginx/html

```
docker run -d --name nginx -p 8080:80 --mount type=bind,source="$(pwd)",target=/usr/share/nginx/html nginx
```
* -v = volume cria a pasta caso ela não exista

* --mount = não cria a pasta, e caso não exista, retorna erro


```
docker run --name nginx02 -d --mount type=volume,source=candidosouzadesenvolvedorfullcycle,target=/app nginx

```

```
docker run --name nginx -d -v meuvolume:app/ nginx
```

## Imagens

##### ver imagens

```
docker images
```

##### removendo uma imagem

```
docker rmi nome-imagem:tag
```

##### remover todas as imagens

```
docker rmi $(docker images)
```

##### baixar uma imagem, não roda o container

```
docker pull php
```

##### baixar uma imagem com sua tag

```
docker pull php:rc-alpine
```

##### criando uma imagem no docker

* -t = tag

```
docker build -t candidosouzza/nginx-vim:latest .
```

##### criando uma imagem

* criar o Dockerfile e rodar o comando

```
docker build -t candidosouzza/nginx-fullcycle .
```

* rode a imagem

```
docker run --rm -d -p 8080:80 candidosouzza/nginx-fullcycle
``` 
* subir a imagem no docker hub

```
docker push candidosouzza/nginx-fullcycle
```

## Networks

##### tipos
* bridge
O driver de rede padrão. Se você não especificar um driver, este é o tipo de rede que você está criando. As redes de ponte geralmente são usadas quando seus aplicativos são executados em contêineres autônomos que precisam se comunicar.

* host
Para contêineres autônomos, remova o isolamento de rede entre o contêiner e o host Docker e use a rede do host diretamente.

* overlay
Redes de sobreposição conectam vários daemons Docker e permitem que os serviços de swarm se comuniquem entre si. Você também pode usar redes de sobreposição para facilitar a comunicação entre um serviço swarm e um contêiner independente, ou entre dois contêineres independentes em diferentes daemons do Docker. Essa estratégia elimina a necessidade de fazer o roteamento no nível do sistema operacional entre esses contêineres

* maclan
As redes Macvlan permitem que você atribua um endereço MAC a um contêiner, fazendo com que ele apareça como um dispositivo físico em sua rede. O daemon Docker roteia o tráfego para contêineres por meio de seus endereços MAC. Usar o macvlan driver às vezes é a melhor escolha ao lidar com aplicativos legados que esperam ser conectados diretamente à rede física, em vez de roteados pela pilha de rede do host Docker

* none
Para este contêiner, desative todas as redes. Normalmente usado em conjunto com um driver de rede personalizado. none's não está disponível para serviços de swarm.

##### comandos network's

##### lista todos as networks

```
docker network ls
```

##### criando uma network

```
docker network create --drive bridge nome-da-rede 
```

##### inspecionando uma network

* retorna um json dos dados da network

```
docker network inspect id-da-network (ou) nom```
e-da-network
```

##### removendo network

```
docker network rm nome-da-network
```

##### removendo todos as networks não usadas

```
docker network prune
```

##### ajuda com networks

```
docker network --help
```

##### configurando containers com network bridge

```
docker run -d -it --name ubuntu1 bash
```

```
docker run -d -it --name ubuntu2 bash
```

```
docker network inspect bridge
```

* saida :

```
...
"Containers": {
            "40bb7ed507c106049a865fc04b3c3dcb1395f12a4657845678b4d522ebcd9979": {
                "Name": "ubuntu1",
                "EndpointID": "3c20d358958ed55c976518009f1a409cbcf84dfddcc3cb53703100e20eb9708a",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            },
            "dcbe4b35b1b6d8354be851dadfe38024223ce587fa1e293f6195d72952ef4f25": {
                "Name": "ubuntu2",
                "EndpointID": "2bbbbef037fdca43c8e6e43142bf6619e83a3b02910c319ed4082790ef6e243c",
                "MacAddress": "02:42:ac:11:00:03",
                "IPv4Address": "172.17.0.3/16",
                "IPv6Address": ""
            }
        },
...
```

##### Configuração de Network externa default bridge

* windows - inserir no arquivo C:\Windows\system32\drivers\etc\hosts

* linux - inserir no arquivo ~/etc/hosts

```
127.0.0.1 host.docker.internal
```

* docker-compose.yml inserir no container principal

```
extra_hosts:
  - "host.docker.internal:172.17.0.1"
```

*  Acesso do container para localhost na maquina com extra hosts

```
curl http://host.docker.internal:8000
```


## Dicas de comandos

##### inspeciaondo o container, retornará um json de informações

```
docker inspect nome-do-container
```

ex:

```
docker inspect schoolofnet
```

##### restartar um container

```
docker restart nome-do-container
```

##### verificar s alterações feita no container até o momento

```
docker diff id-do-container
```

##### criando imagem e iniciando container com um diretório de desenvolvimento local

```
docker run -d -p 8084:80 -v /home/candidosouza/estudos/docker/dev/:/usr/share/data --name sondev python
```

##### criando imagem e iniciando container com o mesmo volume

```
docker run -d -p 8080:8181 --volumes-from nome-do-container-existente --name nomo-do-container nome-da-imagem
```

ex:

``` docker run -d -p 8080:8181 --volumes-from dev --name wpnginx nginx 
```


##### criando variáveis de embiente no container

```
docker run -e (--env) MINHA_VARIAVEL=valor-da-minha-variavel
```

ex:

```
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag
```

##### linkando containers mysql e wordpress


*criando imagem e baixando o container mysql com o banco blog_son

```
docker run --name mysqlserver -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=blog_son -d mysql:5.7
```


*criando imagem do wordpress e linkando o container do wordpress ao mysql

```
docker run --name blogson --link mysqlserver:mysql -d -p 8088:80 wordpress
```

##### entrar no container do wordpress

```
docker blogson bash
```

*instalar o vim

```
apt update
apt upgrade
apt install vim -y
```

*instalar o mysql-client

```
apt install mysql-client
```

*entrar no mysql

```
mysql -uroot -h mysql -p
```


##### caso precisar editar o php.ini para upload

https://github.com/docker-library/wordpress/issues/10


* Encontrei algo que parece funcionar para mim. Eu criei um arquivo uploads.ini com o seguinte conteúdo:

```
file_uploads = On
memory_limit = 64M
upload_max_filesize = 64M
post_max_size = 64M
max_execution_time = 600
Então adicionei o ini ao caminho conf.d apropriado que encontrei no phpinfo (/usr/local/etc/php/conf.d/):
```

```
docker run --name some-wordpress --link=some-mysql:mysql -e WORDPRESS_DB_NAME=some_wordpress -v /var/docker/```uploads.ini:/usr/local/etc/php/conf.d/uploads.ini -v /var/docker/phpinfo.php:/var/www/html/phpinfo.php -p 8081:80  -d wordpress
Meu limite de upload de wordpress está agora em 64M, o que é suficiente para o que eu preciso. Espero que isso ajude alguém.
```

***********************************************************************************************************


##### criando imagem a partir do Dockerfile


$ docker build -t nome-da-imagem/nome-do-serviço .(o ponto indica o diretório corrente para construir a imagem)

ex:
$ docker build -t dev/nginx .


arquivo Dockerfile simples

```
FROM ubuntu

MAINTAINER Candido Souza

RUN apt-get update 

RUN apt-get install nginx vim -y && apt-get clean

ADD ./configs/nginx.conf /etc/nginx/sites-enabled/default

RUN ln -sf /dev/stdout /var/log/nginx/access.log

RUN ln -sf /dev/stderr /var/log/nginx/error.log

RUN echo "daemon off;" >##### /etc/nginx/nginx.conf

EXPOSE 8080

ENTRYPOINT ["/usr/sbin/nginx"]

CMD ["start", "-g"]
```

##### criando um container para a imagem criada através do Dockerfile

```
docker run -d -p 8001:8080 nome-da-imagem
```

ex:

```
$docker run -d -p 8001:8080 devnginx
```

##### rodando os serviços com docker-compose

```
docker-compose up -d
```

##### ex. do arquivo docker-compose.yml

```
version: '2'

services:
  db:
    image: mysql:5.7
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: blog_son
      MYSQL_USER: root
      MYSQL_PASSWORD: root

  wordpress:
    depends_on:
      - db
    image: wordpress:latest
    ports:
      - "8010:80"
    restart: always
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: admin
      WORDPRESS_DB_PASSWORD: a1s2d3f4
volumes:
  db_data:

```


##### docker swarm

##### para iniciar o docker swarm

```
$ docker swarm init
```

passando o rede para trabalho

```
$ docker swarm init --advertise-addr
```

##### dicas

https://woliveiras.com.br/posts/comandos-mais-utilizados-no-docker/
