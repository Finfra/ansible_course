git clone https://github.com/Finfra/ansible_quickstart 
cd ansible_quickstart/
vagrant up
vagrant status
vagrant ssh s1 --command "cd /vagrant/forVm;git clone https://github.com/Finfra/ansible_course.git"
ls forVm
