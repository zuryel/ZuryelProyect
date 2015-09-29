#!/bin/bash 

sudo groupadd administrativos
sudo groupadd profesores
sudo groupadd alumnos

cd /home
sudo mkdir escuela

cd escuela
sudo mkdir administrativos
sudo mkdir profesores
sudo mkdir alumnos

chgrp administrativos administrativos
chgrp profesores profesores
chgrp alumnos alumnos

echo 'Elija una opcion' 
echo '1. Create user alumno' 
echo '2. Create user profesor' 
echo '3. Create user administrativo'
read n 
if [ $n = 1 ]; then 
echo 'Ingrese el nombre de alumno'
read user 
sudo useradd $user -d /home/escuela/alumnos/$user -m -g alumnos
sudo passwd $user 
cd /home/escuela/alumnos/
sudo chmod 705 $user  
fi 
if [ $n = 2 ]; then 
echo 'Ingrese el nombre de profesor'
read user
sudo useradd $user -d /home/escuela/profesores/$user -m -g profesores
sudo passwd $user 
cd /home/escuela/profesores/
sudo chmod 750 $user
fi 
if [ $n = 3 ]; then 
echo 'Ingrese el nombre de administrativo'
read user 
sudo useradd $user -d /home/escuela/administrativos/$user -m -g administrativos 
sudo passwd $user 
cd /home/escuela/administrativos/ 
sudo chmod 770 $user 
fi
