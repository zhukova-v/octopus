#!/bin/bash

#########################################
# Paid GeoIP DB:
# DB location http://geoip.lucky-labs.com
#
# CheckMK check:
# /usr/lib/check_mk_agent/local/geoip.sh
#########################################

Host=$(hostname -s)
Url="http://geoip.lucky-labs.com/"
GeoIP="GeoIP.dat"
GeoIP2="GeoIP2-Country.mmdb"
GeoIPCity="GeoIPCity.dat"
GeoIPCity2="GeoIP2-City.mmdb"
NginxIncDir="/etc/nginx/include/"
Notify="admins@lucky-labs.com"
Wget=$(command -v wget)


if [[ ! -z ${Wget} ]]; then
    ${Wget} -N ${Url}${GeoIP} -O ${NginxIncDir}${GeoIP} 
    ${Wget} -N ${Url}${GeoIPCity} -O ${NginxIncDir}${GeoIPCity}
    ${Wget} -N ${Url}${GeoIP2} -O ${NginxIncDir}${GeoIP2}
    ${Wget} -N ${Url}${GeoIPCity2} -O ${NginxIncDir}${GeoIPCity2}
    service nginx reload
fi

exit 0

