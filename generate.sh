#!/bin/bash
echo -n "Your IP: "
read hostIP
echo -n "Extension Name: "
read name

mkdir $name
cd $name
touch manifest.json
touch content.js
wget 
