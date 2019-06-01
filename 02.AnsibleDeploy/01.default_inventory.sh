echo "StrictHostKeyChecking=no" > ~/.ssh/config
chmod 600 ~/.ssh/config
ansible all -m ping  -u vagrant  --extra-vars  "ansible_password=vagrant host_key_checking=False"
