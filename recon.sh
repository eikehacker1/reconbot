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

cat mass.txt | gf xss | tee -a xss.txt
cat mass.txt | gf redirect | tee -a redirect.txt
cat mass.txt | gf rce | tee -a rce
cat mass.txt | gf sqli | tee -a sqli
cat mass.txt | gf ssti | tee -a ssti
cat mass.txt | gf idor | tee -a idor
