cat <<EOF> playbook.yml
- hosts: db
  tasks:
    - name: touch file
      file:
        state: touch
        path: /tmp/test{{ item }}
      with_sequence: start=1 end=5  
      when: item|int > 3
EOF

# # ==
# cat <<EOF> playbook.yml
# - hosts: db
#   tasks:
#     - name: touch file
#       file:
#         state: touch
#         path: /tmp/test{{ item }}
#       with_items: [ 0, 2, 4, 6, 8, 10 ]
#       when: item > 3
# EOF

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
