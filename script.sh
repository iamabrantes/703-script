#!/bin/bash
#-------------------------------#
# Autor: Jonathan Abrantes
# Curso: 703
# Email: jonathan.abrantes@4linux.com.br
#-------------------------------#
TIME=2
clear
echo "Ola humano!!"
echo " "
echo "Qual o seu nome?"
read NOME
echo " "
echo "Boas vindas $NOME ao Fabuloso Mundo do Shell!!"
sleep $TIME
echo " "
echo "Por questoes de seguranca, qual eh a sua idade?"
read IDADE
if [ $IDADE -ge 18 ]
then
    echo "Ok, você pode utilizar esse script ate o final"
else
    echo "Voce precisa de uma autorizacao para utilizar o mesmo"

    sleep $TIME
    echo "Voce possui autorizacao?(yes/no)"
    read RESPOSTA;
    echo " "
    case "$RESPOSTA" in
        yes|YES|y)
            echo "Beleza, vamos prosseguir"
            ;;
        no|NO|n)
            echo "Voce nao pode utilizar esse script"
            sleep $TIME
            exit 0
            ;;
        *)
            echo "Opcao invalida, saindo do programa"
            sleep $TIME
            exit 0
    esac
fi

echo "Oii, eu sou o Shell."
echo " "
echo "Se quiser saber mais sobre mim, execute o comando 'man bash/, quando encerrar este programa."
sleep $TIME
echo " "
echo "Mas... Se quiser saber sobre mim agora, vou te mostrar minha documentacao, voce tem 5 segundos para pensar com carinho"
echo " "

for i in $(seq 5);
do
    echo $i;
    sleep 1
done

echo " "
echo "E ai, ja pensou?"
echo "Digite 1 para executar o manual"
echo "Digite 2 caso nao tenha pensado ainda"
read RESP 
if [ $RESP == "1" ]
then
    man bash > manual-bash && cat manual-bash
    echo "###################################"
    echo " "
    echo "Viva!, Agora voce vai aprender tudo sobre mim!"
    sleep $TIME
elif [ $RESP == "2" ]
then
    echo "Vou te dar mais alguns segundos para se decidir"
    a=1
    while [ $a -le 10 ]; do
        echo $a;
        sleep 1
        ((a++))
    done
    sleep $TIME
    echo " "
    apt-get install figlet -y > /dev/null 2>&1
    figlet Error 404
    echo " "
    sleep 4
fi
while true; do
    echo "##########################"
    echo "#GERENCIAMENTO DO SISTEMA#"
    echo "##########################"
    echo "1 - Atualizar os repositorios e os pacotes"
    echo "2 - Limpeza de pacotes nao utilizados no sistema"
    echo "3 - Realizar backup de um diretorio"
    echo "4 - Fazer uma lista de Super Herois"
    echo "5 - Adicionar um usuario ao sistema"
    echo "0 - Sair"
    echo " "
    read -a OPCAO -p "Escolha uma opcao:"
    NOMEBKP=""backup_"`date +"%d"-"%m"-"%Y"."%H":"%M":"%S"`"
    if [ $OPCAO == "1" ]
    then
        echo "Atualizando os repositorios e os pacotes"
        apt-get update && apt-get upgrade -y
        sleep $TIME
        echo "Atualizado com sucesso"        
    elif [ $OPCAO == "2" ]
    then
        echo "Removendo pacotes nao utilizados"
        apt autoremove
        sleep $TIME
        echo "Removido com sucesso"
    elif [ $OPCAO == "3" ]
    then
        echo "Qual diretorio voce quer realizar o backup?"
        read DIR;
        mkdir -p /root/backups
        tar -cjf /root/backups/$NOMEBKP.tar.bz /$DIR > /dev/null 2>&1
        sleep $TIME
        echo "Backup realizado"
    elif [ $OPCAO == "4" ]
    then
        echo "Escreva o nome dos superherois dividindo os por espaco"
        read HEROIS
        echo "Herois Listados"
        echo " "
        for super in ${HEROIS[@]};
        do
            echo $super
        done
    elif [ $OPCAO == "5" ]
    then
        read -a USER -p "Qual o nome do usuario que pretende criar?"
        useradd -m -s /bin/bash $USER
    elif [ $OPCAO == "0" ]
    then
        echo "Saindo do programa"
        exit 0;
    fi
done
