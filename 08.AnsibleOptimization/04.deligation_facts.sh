echo --------------------------------------------------------------------------------
echo [ Clear and Setting ]
echo --------------------------------------------------------------------------------
[[ -f ansible.cfg ]]&& rm ansible.cfg
echo --------------------------------------------------------------------------------



cat <<EOF> playbook.yml
- hosts: n1
  tasks:
  - name: Facts from a server
    setup:
    delegate_to: n2    
  - debug: 
      var: ansible_eth1['ipv4']['address']
EOF

echo --------------------------------------------------------------------------------
echo ansible-playbook playbook.yml
echo --------------------------------------------------------------------------------
ansible-playbook  playbook.yml
echo --------------------------------------------------------------------------------




cat <<EOF> playbook_delegate_facts.yml
- hosts: n1
  tasks:
  - name: Facts from a server
    setup:
    delegate_to: n2
    delegate_facts: True
  - debug: 
      var: ansible_eth1['ipv4']['address']

EOF

echo --------------------------------------------------------------------------------
echo ansible-playbook playbook_delegate_facts.yml
echo --------------------------------------------------------------------------------
ansible-playbook playbook_delegate_facts.yml
echo --------------------------------------------------------------------------------


# echo --------------------------------------------------------------------------------
# echo [ Clear and Setting ]
# echo --------------------------------------------------------------------------------
# [[ -f ansible.cfg ]]&& rm ansible.cfg
# echo --------------------------------------------------------------------------------
