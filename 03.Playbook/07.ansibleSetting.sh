sudo mv /etc/ansible/hosts /etc/ansible/hosts.$(date +"%s")
cat <<EOF> hosts
n1
[web]
n2
n3
[db]
n4
EOF
sudo mv hosts /etc/ansible/hosts

sudo mv /etc/ansible/ansible.cfg /etc/ansible/ansible.cfg.$(date +"%s")
cat <<EOF> ansible.cfg
[defaults] 
forks = 50
host_key_checking = False

[privilege_escalation]
inventory = /etc/ansible/hosts
become=True
become_method=sudo
become_user=root
become_ask_pass=False
EOF

sudo mv ansible.cfg /etc/ansible/ansible.cfg

echo --------------------------------------------------------------------------------
echo '/etc/ansible/hosts'
echo --------------------------------------------------------------------------------
cat /etc/ansible/hosts
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------
echo '/etc/ansible.cfg'
echo --------------------------------------------------------------------------------
cat /etc/ansible.cfg
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------
echo 'ansible --version'
echo --------------------------------------------------------------------------------
ansible --version
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------
echo 'ansible web -m shell -a "whoami"'
echo --------------------------------------------------------------------------------
ansible web -m shell -a "whoami"
echo --------------------------------------------------------------------------------


