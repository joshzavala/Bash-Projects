# This is a small training project that I completed for the NEW Apprenticeship program.

#!/bin/bash

# creates variables to make editing and troubleshooting the script easier
pa=~/project/project
p=project

# making a project and haiku directory in the home folder
mkdir ~/$p
mkdir ~/haikus

for i in {1..100}
do
    # creating folders project1-project100 in ~/project/
    mkdir $pa$i
    # creating a .jpg and .png file for each sub directory and creating a .txt file with some haiku text in the sub directories.
    touch $pa$i/$p\_picture.jpg $pa$i/$p\_image.png; echo "An old silent pond" > $pa$i/$p\_doc.txt
    # renaming all 100 .txt files in each sub directory to favorite_haiku and then moving them into the haiku folder in ~
    mv $pa$i/$p\_doc.txt $pa$i/favorite_haiku$i.txt; mv $pa$i/favorite_haiku$i.txt ~/haikus
done

# removing the empty project directory along with all its sub directories.
rm -r ~/$p
