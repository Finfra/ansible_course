#!/bin/bash
# clear
find ./  -iname "*\.txt" |xargs rm -f 
find ./  -iname "*\.cfg" |xargs rm -f 
find ./  -iname "*\.html" |xargs rm -f 
find ./  -iname "*\.yml" |xargs rm -f 
find ./  -iname "*\.retry" |xargs rm -f 

find ./  -iname "inventory" |xargs rm -f 

# executerable
find ./  -iname "*sh" |xargs chmod +x

