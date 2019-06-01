[[ -f ansible.cfg ]]&& rm ansible.cfg
cat <<EOF> playbook.yml
---
- hosts: all
  # gather_facts: no
  tasks:
  - name : Print some facts
    debug:
      msg: >
        Ip of {{ ansible_hostname }} is {{ ansible_all_ipv4_addresses }}
EOF

echo --------------------------------------------------------------------------------
echo 'ansible-playbook playbook.yml'
echo --------------------------------------------------------------------------------
ansible-playbook playbook.yml
echo --------------------------------------------------------------------------------

