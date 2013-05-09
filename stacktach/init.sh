sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password $MYSQL_PASSWORD'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password $MYSQL_PASSWORD'
apt-get -q -y install mysql-server
mysql -u root --password=$MYSQL_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $STACKTACH_DB_NAME;"

git clone $STACKTACH_REPO ~/stacktach_app

pip install -r ~/stacktach_app/etc/pip-requires.txt

python ~/stacktach_app/manage.py syncdb

envsubst < stacktach/etc/sample_stacktach_worker_config.json > ~/stacktach_app/etc/stacktach_worker_config.json
export STACKTACH_WORKER_CONFIG=~/stacktach_app/etc/stacktach_worker_config.json
