#!/bin/bash

sudo yum update -y
if [ $? -eq 0 ]; then
  echo "updated successfully"
  sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
  if [ $? -eq 0 ]; then
    echo "Repo added successfully"
    sudo dnf install docker-ce docker-ce-cli containerd.io -y
    if [ $? -eq 0 ]; then
      docker version
        if [ $? -eq 0 ]; then
        echo "Docker Installed Successfully"
        sudo systemctl enable docker
        sudo systemctl start docker
        sudo chmod 777 /var/run/sock
        if [ $? -eq 0 ]; then
          echo "Docker is started"
        else
          echo "Failed to start"
        fi
      fi
    fi
  fi
fi















fi
fi
fi
fi
fi
fi
