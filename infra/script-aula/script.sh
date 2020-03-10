#!/bin/bash


echo "downloading vagrant file"

cd /home/docker8721

curl -O https://gist.githubusercontent.com/alefhsousa/80f58db0295a3f6025e77f5e6a3850c1/raw/fa5bc23dbf8933f8478172306450bc8318982b70/Vagrantfile

vagrant up && vagrant destroy

