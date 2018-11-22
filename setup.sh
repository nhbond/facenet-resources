#!/bin/bash

#This script automates the file structure setup
#If you are following my structure exactly, then feel free to use it

cp demo.sh ~/Projects/facenet
cp -r models ~/Projects/facenet
cp -r test_raw/ train_raw/ ~/Projects/facenet/data/images/
