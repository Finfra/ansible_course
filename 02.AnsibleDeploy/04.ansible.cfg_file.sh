echo 'ansible all -m ping  -u vagrant -f 30 --extra-vars "ansible_password=vagrant host_key_checking=False"'
echo ' ↓'
echo 'ansible all -m ping --extra-vars "ansible_password=vagrant"'

cat <<EOF> ansible.cfg
[defaults] 
forks = 50
host_key_checking = False
ansible_user = vagrant
ansible_password = vagrant
EOF

echo "---------------"
echo "./ansible.cfg "
echo "---------------"
cat ansible.cfg
echo "---------------"
ansible all -m ping --extra-vars "ansible_password=vagrant"