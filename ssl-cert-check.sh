#!/bin/bash

array=(

# google.com
google.com
www.google.com

# example.com
example.com

)

EXPIRED=false

for i in ${array[@]}
do

	if ! true | openssl s_client -connect $i:443 2>/dev/null | openssl x509 -noout -checkend 0; then
		if ! $EXPIRED; then
			echo "Expired certificate(s)"
			EXPIRED=true
		fi
		echo $i
	fi

done
