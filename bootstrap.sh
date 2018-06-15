#! /usr/bin/env bash

#ansible install
yum install epel-release -y
yum install ansible -y 


mkdir -p /home/vagrant/.vim/autoload /home/vagrant/.vim/bundle
touch /home/vagrant/.vimrc
touch /home/vagrant/.bashrc
