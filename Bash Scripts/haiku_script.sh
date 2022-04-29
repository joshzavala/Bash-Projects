#!/bin/bash

pa=~/project/project
p=project

mkdir ~/$p
mkdir ~/haikus

for i in {1..100}
do
    mkdir $pa$i
    touch $pa$i/$p\_picture.jpg $pa$i/$p\_image.png; echo "An old silent pond" > $pa$i/$p\_doc.txt
    mv $pa$i/$p\_doc.txt $pa$i/favorite_haiku$i.txt; mv $pa$i/favorite_haiku$i.txt ~/haikus
done

rm -r ~/$p