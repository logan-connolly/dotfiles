#!/bin/bash

configure_poetry() {
  poetry config virtualenvs.in-project
}

configure_pacman() {
  sudo sed -i 's/#Color/Color/' /etc/pacman.conf
}

configure_poetry
configure_pacman
