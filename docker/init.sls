#!yaml
#install docker-ce
#/srv/salt/docker/init.sls

docker-repo:
  pkgrepo.managed:
    - humanname: Docker-ce
    - key_url: https://download.docker.com/linux/ubuntu/gpg
    - architectures: amd64
    - name: deb https://download.docker.com/linux/ubuntu/ xenial stable  

docker:
  pkg.installed:
    - name: docker-ce
  service.running:
    - name: docker
    - require:
      - pkg: docker-ce

#to use salt docker modules docker-py needs to be installed
#docker-py needs pkg python-pip
docker-py requirements:
  pkg.installed:
    - name: python-pip
    
docker-py install:
  pip.installed:
    - name: docker-py
    - reload_modules: true

