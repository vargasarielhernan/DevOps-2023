#!/bin/bash

#Variable
repo="DevOps-2023"
USERID=$(id -u)
USER_HOME=$(eval echo ~$SUDO_USER)
#colores
LRED='\033[1;31m'
LGREEN='\033[1;32m'
NC='\033[0m'
LBLUE='\033[0;34m'
LYELLOW='\033[1;33m'

#Ejecucion del script como superusuario
if [[ ${USERID} -ne 0 ]]; then
        echo -e "\n${LRED} Ejecutar script como root${NC}"
	echo -e "\n${LRED} Saliendo del script...${NC}"
        exit 1
fi


#Paqueteria
echo "#########################################################"
apt update
echo -e "\n${LGREEN}El servidor se encuentra actualizado...${NC}"
echo "====================================="
echo "Verificando curl"

if dpkg -l |grep -q curl;
then
    echo "Curl instalado en sistema"
else
    echo "instalando curl"
        apt install -y curl
fi

##########INSTALACION DOCKER##################

if dpkg -l | grep -q docker; then
	echo -e "\n${LBLUE} Docker ya se encuentra instalado....${NC}"
else
	echo -e "\n${LBLUE} Instalando paquete Docker...${NC}"
        sudo apt-get install ca-certificates curl gnupg
        sudo install -m 0755 -d /etc/apt/keyrings
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
        sudo chmod a+r /etc/apt/keyrings/docker.gpg
        echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
         $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt-get update
        sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
fi
## Clonacion del repositorio
if [[ -d $repo ]]; then
    echo -e "\n${LBLUE} El repositorio ${repo} existe....${NC}"
    cd ${repo}
    git pull origin main
    
else
    echo -e "\n${LBLUE} Clonando el repositorio....${NC}"
    git clone git@github.com:vargasarielhernan/$repo.git
    cd ${repo}
    #git checkout clase2-linux-bash
    git pull origin main
    echo $repo
fi
echo "ingresando a carpeta contenedora de docker-compose"
cd 295words-docker
chmod +x docker-compose-smooth-Operator.yml
docker-compose-smooth-Operator.yml up --build


