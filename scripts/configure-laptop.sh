#!/bin/bash

setup_tlp() {
  echo "Setting up TLP service for better battery life."
  paru --noconfirm -S tlp
  sudo systemctl enable --now tlp.service
}

setup_lenovo() {
  echo "Adding packages related to lenovo laptop"
  paru --noconfirm -S sof-firmware fwupd
}

setup_tlp
setup_lenovo
