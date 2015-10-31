echo " excute "
echo "sed -e $(env | sed -e 's/\//\\\//g' | awk -F= '{print "-e \"s/{{" $1 "}}/" $2 "/g\" "}' | sed -e 's/\([\/"]\)/\\\1/g' | xargs echo) /nginx.conf.template > /etc/nginx/nginx.conf"
echo "sed -e $(env | sed -e 's/\//\\\//g' | awk -F= '{print "-e \"s/{{" $1 "}}/" $2 "/g\" "}' | sed -e 's/\([\/"]\)/\\\1/g' | xargs echo) /nginx.conf.template > /etc/nginx/nginx.conf" | sh
nginx -g "daemon off;"
