#!/bin/bash


enable_services() {
  sudo usermod -aG docker $USER
  sudo systemctl enable --now docker.service
  sudo systemctl enable --now bluetooth.service
  sudo systemctl enable --now reflector.service
  sudo ufw enable
}
