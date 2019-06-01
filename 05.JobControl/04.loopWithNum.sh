cat <<EOF> playbook.yml
- hosts: db
  tasks:
    - name: touch file
      file:
        state: touch
        path: /tmp/test{{ item }}
      with_sequence: start=1 end=5
    # - name: touch file
    #   file:
    #     state: touch
    #     path: /tmp/testa{{ item }}
    #   with_sequence: start=1 end={{ ansible_all_ipv4_addresses|length }}  
EOF

echo --------------------------------------------------------------------------------
echo 'ansible-playbook playbook.yml'
echo --------------------------------------------------------------------------------
ansible-playbook playbook.yml
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------
echo 'ansible db -m shell -a "ls /tmp/test*"'
echo --------------------------------------------------------------------------------
ansible db -m shell -a "ls /tmp/test*"
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------
echo 'ansible db -m shell -a "rm -f /tmp/test*"'
echo --------------------------------------------------------------------------------
ansible db -m shell -a "rm -f /tmp/test*"
echo --------------------------------------------------------------------------------
