# cria o container apatir da imagem do ubuntu
FROM ubuntu:latest

# ENTRYPOINT comando fixo, não pode ser substituido
ENTRYPOINT [ "echo", "Hello World" ]

# CMD comando variável que entra como parametro para o entrypoint
# docker run --rm candidosouzza/hello candido
#
# saída "Hello World candido"
#
# CMD executa um comando, porém pode ser subistiuido ex:
# docker run --rm candidosouzza/hello echo Olá Mundo Candido Souza FullStack e FullCycle
# docker run --rm candidosouzza/hello bash
CMD [ "echo", "Candido Souza FullCycle" ]