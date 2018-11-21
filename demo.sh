#!/bin/bash

# Set python path variable to facenet directory
export PYTHONPATH=~/Projects/facenet/src

# remove existing training alignment
rm -rf ~/Projects/facenet/data/images/train_aligned

# align training images
python src/align/align_dataset_mtcnn.py \
~/Projects/facenet/data/images/train_raw \
~/Projects/facenet/data/images/train_aligned \
--image_size 160

# remove existing testing alignment
rm -rf ~/Projects/facenet/data/images/test_aligned

# align testing images
python src/align/align_dataset_mtcnn.py \
~/Projects/facenet/data/images/test_raw \
~/Projects/facenet/data/images/test_aligned \
--image_size 160

# Train new classifier based on training images (generates pickle)
python src/classifier.py TRAIN ~/Projects/facenet/data/images/train_aligned/ ~/Projects/facenet/models/20180402-114759.pb ~/Projects/facenet/models/my_classifier.pkl

# Test face matches using pickle file to classify matching images
python src/classifier.py CLASSIFY ~/Projects/facenet/data/images/test_aligned/ ~/Projects/facenet/models/20180402-114759.pb ~/Projects/facenet/models/my_classifier.pkl
