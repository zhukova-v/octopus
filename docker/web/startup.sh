#!/bin/bash

# Function to update the fpm configuration to make the service environment variables available
function setEnvironmentVariable() {

    if [ -z "$2" ]; then
            echo "Environment variable '$1' not set."
            return
    fi

    echo "env[$1] = $2" >> /etc/php/7.0/fpm/pool.d/www.conf
}

# Grep for variables that look like docker set them (_PORT_)
for _curVar in `env | grep _PORT_ | awk -F = '{print $1}'`;do
    # awk has split them by the equals sign
    # Pass the name and value to our function
    setEnvironmentVariable ${_curVar} ${!_curVar}
done

service php7.0-fpm start && nginx