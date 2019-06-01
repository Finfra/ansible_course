cat <<EOF> hosts2.txt
n1
n2
EOF

cat <<EOF> ansible.cfg
[defaults] 
host_key_checking = False
EOF

ansible all -i hosts2.txt -m ping -u vagrant  --extra-vars "ansible_password=vagrant host_key_checking=False"
