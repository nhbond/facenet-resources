#!/bin/bash

# Set python path variable to facenet directory
export PYTHONPATH=~/Projects/facenet/src

# remove existing training alignment
rm -rf ~/Projects/facenet/data/train

# align training images
python src/align/align_dataset_mtcnn.py \
~/Projects/facenet/data/raw/train_raw \
~/Projects/facenet/data/train \
--image_size 160

# remove existing testing alignment
rm -rf ~/Projects/facenet/data/test

# align testing images
python src/align/align_dataset_mtcnn.py \
~/Projects/facenet/data/raw/test_raw \
~/Projects/facenet/data/test \
--image_size 160

# Train new classifier based on training images (generates pickle)
python src/classifier.py TRAIN ~/Projects/facenet/data/train/ ~/Projects/facenet/models/20180402-114759.pb ~/Projects/facenet/models/my_classifier.pkl

# Test face matches using pickle file to classify matching images
python src/classifier.py CLASSIFY ~/Projects/facenet/data/test/ ~/Projects/facenet/models/20180402-114759.pb ~/Projects/facenet/models/my_classifier.pkl
