[[ -f ansible.cfg ]]&& rm ansible.cfg


cat <<EOF> custom.fact
[general]
package = httpd
service = httpd
state = started
EOF

cat <<EOF> setup_facts.yml
- name: userDefinedFacts for remote node
  hosts: web
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
- name: Install Apache and starts the service
  hosts: web

  tasks:
    - name: Install the required package
      yum:
        name: "{{ ansible_local.custom.general.package }}"
        state: latest
    - name: Start the service
      service:
        name: "{{ ansible_local.custom.general.service }}"
        state: "{{ ansible_local.custom.general.state }}"
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
read -p "<< press enter, or cancel to ctl+c >>" ok


echo --------------------------------------------------------------------------------
echo 'ansible n2 -m command -a "systemctl status httpd"'
echo --------------------------------------------------------------------------------
ansible n2 -m command -a 'systemctl status httpd'
echo --------------------------------------------------------------------------------

cat <<EOF> custom.fact
[general]
package = httpd
service = httpd
state = stopped
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
echo --------------------------------------------------------------------------------
echo 'ansible-playbook -l n2 setup_facts2.yml'
echo --------------------------------------------------------------------------------
ansible-playbook setup_facts.yml
echo --------------------------------------------------------------------------------
echo --------------------------------------------------------------------------------
echo 'ansible web -m setup -a "filter=ansible_local"'
echo --------------------------------------------------------------------------------
ansible web -m setup -a "filter=ansible_local"


echo --------------------------------------------------------------------------------
echo 'ansible-playbook playbook.yml'
echo --------------------------------------------------------------------------------
ansible-playbook playbook.yml
echo --------------------------------------------------------------------------------

echo --------------------------------------------------------------------------------
echo 'ansible web -m command -a "systemctl status httpd"'
echo --------------------------------------------------------------------------------
ansible web -m command -a 'systemctl status httpd'
echo --------------------------------------------------------------------------------
