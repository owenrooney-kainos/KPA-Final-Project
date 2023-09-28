#!/bin/bash
  sudo apt update -y
  sudo apt install apache2 -y
  sudo su
  echo "<h1>loading from $(hostname -f)..</h1>" > /var/www/html/index.html