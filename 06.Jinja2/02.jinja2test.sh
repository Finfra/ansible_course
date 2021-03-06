echo --------------------------------------------------------------------------------
echo [ Clear ]
echo --------------------------------------------------------------------------------
[[ -f ansible.cfg ]]&& rm ansible.cfg
ansible db -m copy -a "content='' dest=/etc/motd"
echo --------------------------------------------------------------------------------



echo --------------------------------------------------------------------------------
echo ansible db -m shell -a 'cat /etc/motd'
echo --------------------------------------------------------------------------------
ansible db -m shell -a 'cat /etc/motd'
echo --------------------------------------------------------------------------------


cat <<EOF> motd.j2
This system's total memory is: {{ ansible_memtotal_mb }} MBs.
The current free memory is: {{ ansible_memfree_mb }} MBs.
EOF

cat <<EOF> motd.yml
- hosts: db
  tasks:
    - template:
        src: motd.j2
        dest: /etc/motd
        owner: root
        group: root
        mode: 0644
EOF

echo --------------------------------------------------------------------------------
echo ansible-playbook  motd.yml
echo --------------------------------------------------------------------------------
ansible-playbook  motd.yml
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------
echo ansible db -m shell -a 'cat /etc/motd'
echo --------------------------------------------------------------------------------
ansible db -m shell -a 'cat /etc/motd'
echo --------------------------------------------------------------------------------


echo --------------------------------------------------------------------------------
echo 1. type 'ssh n4⏎' to connect n4
echo 2. check motd
echo 3. type 'exit⏎' to exit
echo --------------------------------------------------------------------------------

read -p "<< press enter, or cancel to ctl+c >>" ok

echo --------------------------------------------------------------------------------
echo [ Clear ]
echo --------------------------------------------------------------------------------
[[ -f ansible.cfg ]]&& rm ansible.cfg
ansible db -m copy -a "content='' dest=/etc/motd"
echo --------------------------------------------------------------------------------
