color="\e[33m"
nocolor="\e[0m"
logfile=="/tmp/redis.log"

echo -e "\e[33m Downloading Redis repo\e[0m"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y &>>/tmp/redis.log
echo -e"\e[33m Enabling Redis-6.2 from package\e[0m"
Yum module List &>>/tmp/redis.log
yum module enable redis:remi-6.2 -y &>>/tmp/redis.log
echo -e "\e[33m Installing Redis\e[0m"
yum install redis -y &>>/tmp/redis.log
echo -e "\e[32m Changing the listen address\e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis.conf
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis/redis.conf
echo -e "\e[32m Enabling and starting Redis server\e[0m"
systemctl enable redis &>>/tmp/redis.log
systemctl restart redis
