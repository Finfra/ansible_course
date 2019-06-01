#!/usr/bin/env python
# cf) https://www.jeffgeerling.com/blog/creating-custom-dynamic-inventories-ansible
import sys
import json

if len(sys.argv) == 1 :
    h= {"_meta": {"hostvars": {}}}
elif len(sys.argv) > 1 and sys.argv[1] == "--list":             
    h={"group": {"hosts": ["n1", "n2"], "vars": {}}}
else: 
    h={}

print json.dumps(h)
