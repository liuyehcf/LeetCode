#/bin/bash

for ((i=${1};i<${2};i++))
do
    touch Code${i}.md
done
    