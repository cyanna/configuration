export LC_ALL=C
sudo locale-gen

sudo ansible-playbook -c local ./edx_sandbox.yml -i "localhost," -e edx_platform_repo=https://github.com/cyanna/edx-platform.git -e edx_platform_version='master'
