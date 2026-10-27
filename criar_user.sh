#!/bin/bash

echo "Criando diretórios do sistema....."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Diretórios criados..."

echo "Criando grupos do sistema....."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Grupos criados..."

echo "Criando usuários do sistema" 


useradd carlos -c "Carlos" -s /bin/bash -m -p $(openssl passwd -6 Senha123)
passwd carlos -e

useradd debora -c "Debora" -s /bin/bash -m -p $(openssl passwd -6 Senha123)
passwd debora -e

useradd josefina -c "Josefina" -s /bin/bash -m -p $(openssl passwd -6 Senha123)
passwd josefina -e

echo "Usuários criados...."

echo "Associando usuários aos grupos..."

usermod -G GRP_ADM carlos
usermod -G GRP_VEN debora
usermod -G GRP_SEC josefina

echo "Associação finalizada"

echo "Definindo as permissões dos grupos...."

chmod 770 /adm/
chmod 770 /ven/
chmod 770 /sec/
chmod 777 /publico/

echo "Permissão definida"

echo "Finalizad!!!"
