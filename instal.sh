#!/bin/bash


sudo apt install -y golang


go install github.com/tomnomnom/waybackurls@latest
go install github.com/tomnomnom/assetfinder@latest
go install github.com/tomnomnom/httprobe@latest
go install github.com/ferreiraklet/airixss@latest
go install github.com/tomnomnom/qsreplace@latest
go install github.com/tomnomnom/anew@latest
go install github.com/tomnomnom/qsreplace@latest
go install github.com/ferreiraklet/airixss@latest
wait


cp /root/go/bin/* /usr/bin


git clone https://github.com/tomnomnom/gf
git clone https://github.com/1ndianl33t/Gf-Patterns


mkdir ~/.gf
cp -r gf/examples/* ~/.gf
cp -r Gf-Patterns/* ~/.gf
