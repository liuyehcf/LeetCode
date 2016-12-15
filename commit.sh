#£¡/bin/bash


description=$(date +%Y)"_"$(date +%m)"_"$(date +%d)

git add .

git commit -m $description

git push origin master:master