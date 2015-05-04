export LC_ALL=C
sudo locale-gen
sudo apt-get install -y libffi-dev python-pip xmlsec1 python-dev build-essential 
sudo -H pip install --upgrade pip 
sudo -H pip install --upgrade virtualenv 
sudo -H pip install --upgrade mercurial
sudo ansible-playbook -c local ./edx_sandbox.yml -i "localhost," -e edx_platform_repo=https://github.com/cyanna/edx-platform.git -e edx_platform_version='astea-30Apr'
