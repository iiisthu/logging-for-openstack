#!/bin/bash

prefix=10.1.0.
start=106
end=114
special=10.1.2.115
master=154

read -p "Input the LDAP username on servers: " user
echo $user
read -p "Input the password of LDAP user $user: " -s passwd
echo "\n"

./generate_key.sh

for i in $(eval echo "{$start..$end}" $master);
do
	./copysshkey.sh $user $prefix$i $passwd
done

./copysshkey.sh $user $special $passwd