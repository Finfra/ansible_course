cat <<EOF> hosts3.txt
[web]
n1

[db]
n2

EOF

ansible all -i hosts3.txt -l db  -m ping -u vagrant --extra-vars "ansible_password=vagrant host_key_checking=False"

