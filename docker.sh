#!/bin/bash

#updating the server
sudo yum update -y
if [ $? -eq 0 ]; then
  echo "updated successfully"
  #install docker and docker.registry 
  sudo yum install docker docker.registry -y
  sudo yum install docker -y
    if [ $? -eq 0 ]; then
      #add user to the group
      sudo usermod -aG docker ansible
      #enable the docker service
      sudo systemctl enable docker
      #give the execution permission to the docker.sock
      sudo chmod 777 /var/run/docker.sock
      if [ $? -eq 0 ]; then
        sudo systemctl start docker
        if [ $? -eq 0 ]; then
          echo "Docker is Installed and Started Successfully"
        else
          echo "Failed to start"
        fi
      fi
    fi
  fi
