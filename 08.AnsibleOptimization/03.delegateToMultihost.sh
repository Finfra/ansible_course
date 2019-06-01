echo --------------------------------------------------------------------------------
echo [ Clear and Setting ]
echo --------------------------------------------------------------------------------
[[ -f ansible.cfg ]]&& rm ansible.cfg
echo --------------------------------------------------------------------------------


cat <<EOF> inventory.ini
[web]
n2
n3
[db]
n4
EOF



cat <<EOF> playbook.yml
- hosts: db
  tasks:
  - name: Just show hostname
    shell: hostname
    delegate_to: "{{ item }}"
    register: r
    with_items: "{{ groups['web'] }}"
  
  - debug: 
      msg: Executed in  {{item}}
    with_items: "{{ r.results | map(attribute='stdout') | list }}"

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
