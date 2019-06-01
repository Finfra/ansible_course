echo --------------------------------------------------------------------------------
echo [ Clear and Setting ]
echo --------------------------------------------------------------------------------
[[ -f ansible.cfg ]]&& rm ansible.cfg
echo --------------------------------------------------------------------------------


cat <<EOF> playbook.yml
- hosts: n1
  tasks:
  - name: Just show hostname
    shell: hostname
    #delegate_to: n2
    register: r
  - debug: var=r.stdout_lines
EOF

echo --------------------------------------------------------------------------------
echo ansible-playbook playbook.yml
echo --------------------------------------------------------------------------------
ansible-playbook playbook.yml
echo --------------------------------------------------------------------------------


read -p "<< press enter, or cancel to ctl+c >>" ok
cat <<EOF> playbook2.yml
- hosts: n1
  tasks:
  - name: Just show hostname
    shell: hostname
    delegate_to: n2
    register: r
  - debug: msg={{ r.stdout_lines }}
EOF

echo --------------------------------------------------------------------------------
echo ansible-playbook playbook2.yml
echo --------------------------------------------------------------------------------
ansible-playbook playbook2.yml
echo --------------------------------------------------------------------------------

# echo --------------------------------------------------------------------------------
# echo [ Clear and Setting ]
# echo --------------------------------------------------------------------------------
# [[ -f ansible.cfg ]]&& rm ansible.cfg
# echo --------------------------------------------------------------------------------
