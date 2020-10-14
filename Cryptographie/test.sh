#!/bin/bash

pass1=$1
pass2=$2

if [ $pass1 == $pass2 ]; then
	echo "Le mot de passe est le bon"
else
	echo "Le mot de passe n'est pas bon"
fi
