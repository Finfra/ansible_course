#!/bin/bash

sHome=$(dirname `realpath -s $0`)
chmod +x $sHome/08.DyanamicInventory/inventory.py
ansible all -i $sHome/08.DyanamicInventory/inventory.py --list-hosts

