. dev-env-settings.sh

cp rcfiles/vimrc.txt ~/.vimrc
cp rcfiles/screenrc.txt ~/.screenrc

# Install standard programs and project deps
sudo apt-get update
sudo apt-get install vim screen libxml2-dev libxslt-dev libpq-dev libmysqlclient-dev python python-dev python-pip --assume-yes

git config --global core.editor vim
git config --global color.ui true
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

mkdir ~/.ssh/
wget -O ~/.ssh/id_rsa "$PRIVATE_KEY_URL"
chmod 600 ~/.ssh/id_rsa
wget -O ~/.ssh/id_rsa.pub "$PUB_KEY_URL"
