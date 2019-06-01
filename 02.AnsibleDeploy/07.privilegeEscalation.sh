cat <<EOF> ./inventory
[web]
n1
n2

[db]
n3
n4
EOF

cat <<EOF> ./ansible.cfg
[defaults] 
forks = 50
host_key_checking = False
ansible_user = vagrant
ansible_password = vagrant
inventory = ./inventory
[privilege_escalation]
become = true
become-method = sudo
become_user = root
become_ask_pass =false
EOF


echo --------------------------------------------------------------------------------
echo './inventory'
echo --------------------------------------------------------------------------------
cat ./inventory
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------
echo './ansible.cfg'
echo --------------------------------------------------------------------------------
cat ./ansible.cfg
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------
echo 'ansible web -m shell -a "whoami"'
echo --------------------------------------------------------------------------------
ansible web -m shell -a "whoami"
echo --------------------------------------------------------------------------------


echo --------------------------------------------------------------------------------
echo 'ansible web -a "whoami"'
echo --------------------------------------------------------------------------------
ansible web  -a "whoami"
echo --------------------------------------------------------------------------------