[[ -f ansible.cfg ]]&& rm ansible.cfg

echo "x" > x.txt
echo "y" > y.txt
echo "z" > z.txt

cat <<EOF> playbook.yml
- hosts: db
  tasks:
    - name: Creates directory
      file:
        path: /tmp/test/
        state: directory
    - name: correct index.html is present
      copy:
        src: "{{ item[0] }}"
        dest: "{{ item[1] }}"
      with_nested:
        - ['x.txt','y.txt','z.txt']
        - ['/tmp/test/aa/', '/tmp/test/bb/']
EOF

# ↓

# # with list
# cat <<EOF> playbook.yml
# - hosts: db
#   tasks:
#     - name: Creates directory
#       file:
#         path: /tmp/test/
#         state: directory
#     - name: correct index.html is present
#       copy:
#         src: "{{ item[0] }}"
#         dest: "{{ item[1] }}"
#       with_nested:
#         - 
#           - x.txt
#           - y.txt
#           - z.txt
#         - 
#           - /tmp/test/aa/
#           - /tmp/test/bb/
# EOF

# ↓

# # With Vars
# cat <<EOF> playbook.yml
# - hosts: db
#   vars:
#     file: 
#       - x.txt
#       - y.txt
#       - z.txt
#     folder:
#       - /tmp/test/aa/
#       - /tmp/test/bb/
#   tasks:
#     - name: Creates directory
#       file:
#         path: /tmp/test/
#         state: directory
#     - name: correct index.html is present
#       copy:
#         src: "{{ item[0] }}"
#         dest: "{{ item[1] }}"
#       with_nested:
#         - "{{ file }}"
#         - "{{ folder }}"
# EOF

echo --------------------------------------------------------------------------------
echo 'ansible-playbook playbook.yml'
echo --------------------------------------------------------------------------------
ansible-playbook playbook.yml
echo --------------------------------------------------------------------------------


echo --------------------------------------------------------------------------------
echo 'ansible db -m shell -a "tree /tmp/test/"'
echo --------------------------------------------------------------------------------
ansible db -m shell -a "tree /tmp/test/"
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------
echo 'ansible db -m shell -a "rm -rf  /tmp/test/"'
echo --------------------------------------------------------------------------------
ansible db -m shell -a "rm -rf  /tmp/test/"
echo --------------------------------------------------------------------------------
