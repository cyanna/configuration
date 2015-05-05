export LC_ALL=C
sudo locale-gen

# install dependencies
sudo apt-get install -y libffi-dev python-pip xmlsec1 python-dev build-essential 

# upgrade pip and install mercurial
sudo -H pip install --upgrade pip 
sudo -H pip install --upgrade virtualenv 
sudo -H pip install --upgrade mercurial

# Update nodjs
#curl -sL https://deb.nodesource.com/setup | sudo bash -
#sudo apt-get install -y nodejs

# add premissions to ssh_auth_sock
chmod 777 -R `dirname $SSH_AUTH_SOCK`

# fix missing atlas-3gf
echo "/usr/lib/atlas-base" | sudo tee /etc/ld.so.conf.d/atlas-lib.conf
sudo ldconfig

# fix xqueue setuptools issue (commented because breaks the script)
#sudo -u xqueue bash - 
#source /edx/app/xqueue/venvs/xqueue/bin/activate 
#pip install --upgrade setuptools

# deploy
sudo ansible-playbook -c local ./edx_sandbox.yml -i "localhost," -e edx_platform_repo=https://github.com/cyanna/edx-platform.git -e edx_platform_version='astea-30Apr'
