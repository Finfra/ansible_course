[[ -f ansible.cfg ]]&& rm ansible.cfg


cat <<EOF> custom.fact
[byWho]
updatedBy = nowage
EOF

cat <<EOF> setup_facts.yml
- name: userDefinedFacts for remote node
  hosts: n2
  vars:
    remote_dir: /etc/ansible/facts.d
    facts_file: custom.fact
  tasks:
    - name: Create the remote directory
      file:
        state: directory
        recurse: yes
        path: "{{ remote_dir }}"
    - name: Install the new facts
      copy:
        src: "{{ facts_file }}"
        dest: "{{ remote_dir }}"
EOF


cat <<EOF> playbook.yml
- name: Get cumstom facts
  hosts: n2
  tasks:
  - name : Print some facts
    debug: 
      msg: >
        {{ ansible_hostname }} is updated by {{ ansible_local["custom"]["byWho"]["updatedby"] }}
EOF

echo --------------------------------------------------------------------------------
echo 'ansible-playbook setup_facts.yml'
echo --------------------------------------------------------------------------------
ansible-playbook setup_facts.yml
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------
echo 'ansible-playbook playbook.yml'
echo --------------------------------------------------------------------------------
ansible-playbook playbook.yml
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------
echo 'ansible web -m setup -a "filter=ansible_local"'
echo --------------------------------------------------------------------------------
ansible web -m setup -a "filter=ansible_local"
echo --------------------------------------------------------------------------------


