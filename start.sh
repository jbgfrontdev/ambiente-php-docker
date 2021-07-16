#!/bin/bash
ACTION="$1"

if [ -z "$ACTION" ]; then
    cd docker && docker-compose up -d nginx mysql redis php-fpm phpmyadmin mailhog
elif [ $ACTION == "stop" ]; then
    cd docker && docker-compose down
elif [ $ACTION == "db:create" ]; then
    cd docker && docker-compose exec mysql bash && mysql -u root -p root < /docker-entrypoint-initdb.d/createdb.sql
elif [ $ACTION == "work" ]; then
    cd docker && docker-compose exec workspace bash
else
    cd docker && docker-compose $@
fi;

