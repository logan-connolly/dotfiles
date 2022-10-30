#!/bin/bash

modify_user_groups() {
  groups="docker"
  echo "Adding the following groups to user $USER: $groups"
  for group in $groups
  do
    sudo usermod -aG $group $USER
  done
}

enable_firewall() {
  sudo ufw enable
  echo "ufw firewall enabled."
}

enable_syncthing() {
  sudo systemctl enable --now syncthing@${USER}.service
}

enable_services() {
  services="bluetooth docker gdm"
  echo "Enabling the following services: $services"
  for service in $services
  do
    sudo systemctl enable --now ${service}.service
  done
}

modify_user
enable_firewall
enable_syncthing
enable_services
