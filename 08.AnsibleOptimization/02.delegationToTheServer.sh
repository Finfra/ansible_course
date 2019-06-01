echo --------------------------------------------------------------------------------
echo [ Clear and Setting ]
echo --------------------------------------------------------------------------------
[[ -f ansible.cfg ]]&& rm ansible.cfg
echo --------------------------------------------------------------------------------

cat <<EOF> inventory.ini
n1
n2
EOF

cat <<EOF> playbook.yml
- hosts: n1
  tasks:
    - name: add delegation host
      add_host:
        name: n4srv
        ansible_host: n4
        ansible_suer: vagrant
    - shell: hostname
      delegate_to: n4srv
      register: r
    - debug: var=r.stdout_lines
EOF

echo --------------------------------------------------------------------------------
echo ansible-playbook -i inventory.ini playbook.yml
echo --------------------------------------------------------------------------------
ansible-playbook -i inventory.ini playbook.yml
echo --------------------------------------------------------------------------------
# echo --------------------------------------------------------------------------------
# echo [ Clear and Setting ]
# echo --------------------------------------------------------------------------------
# [[ -f ansible.cfg ]]&& rm ansible.cfg
# echo --------------------------------------------------------------------------------
