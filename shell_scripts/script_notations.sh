#!/bin/sh

# this script uses hard-coded paths 
# This deletes the readme file and begins rebuilding it.. 

cat /home/hass/.homeassistant/script/header.md > /home/hass/.homeassistant/script/README.md

echo "Original work by @beed2112 /n" >> /home/hass/.homeassistant/script/README.md
echo "Modified by [@CCOSTAN](https://twitter.com/ccostan) /n" >> /home/hass/.homeassistant/script/README.md
echo "Repo : https://github.com/CCOSTAN/Home-AssistantConfig /n" >> /home/hass/.homeassistant/script/README.md
echo "Repo : https://github.com/beed2112/condo /n" >> /home/hass/.homeassistant/script/README.md
echo "**This is a map of the script references from my repo.** /n" >> /home/hass/.homeassistant/script/README.md

grep -e '^[a-z]' /home/hass/.homeassistant/script/*.yaml | tr : '\n' > /tmp/scriptnames.txt

sed -i '/^$/d' /tmp/scriptnames.txt


for item in `cat /tmp/scriptnames.txt`
do

  res=`grep -R script.$item /home/hass/.homeassistant/. --include=*.yaml`
  echo "$item \n" | sed 's|/home/hass/\.homeassistant/| https://github\.com/CCOSTAN/Home-AssistantConfig/blob/master|g'>> /home/hass/.homeassistant/script/README.md
  echo "$res  \n" | sed 's|/home/hass/\.homeassistant/\.| https://github\.com/CCOSTAN/Home-AssistantConfig/blob/master|g' >> /home/hass/.homeassistant/script/README.md

sed -i '/^$/d' /home/hass/.homeassistant/script/README.md 
  
done
cat /home/hass/.homeassistant/script/README.md
