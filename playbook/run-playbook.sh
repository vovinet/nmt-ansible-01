#!/bin/bash
#
echo Starting containers...
echo 
#
docker run --rm -d --name centos7 pycontribs/centos:7 sleep 600000
docker run --rm -d --name ubuntu  pycontribs/ubuntu:latest sleep 600000
docker run --rm -d --name fedora pycontribs/fedora:latest sleep 600000

echo running playbbok
echo
ansible-playbook -i ./inventory/prod.yml site.yml --vault-pass-file ./pass.txt

echo Stopping containers and cleaning up...

docker stop centos7
docker stop ubuntu
docker stop fedora
