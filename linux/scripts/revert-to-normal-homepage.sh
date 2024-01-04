#!/bin/bash

## Move into the correct folder
echo ""
echo "Moving into correct folder..."
echo ""
cd /repo/springapi/src/main/resources/templates
echo "Successfully moved into correct folder"
echo ""

## Replace current home page image with new image
echo "Updating image on home page..."
sudo sed -i 's|<img src="https://tech242-fergus-first-bucket.s3.eu-west-1.amazonaws.com/dog.jpg" alt="scary-dog-image">|<img src="/images/friday13th.jpg" alt="friday13thposter">|g' home.html
echo "Image updated successfully"
echo ""

## Delete image from bucket
echo "Deleting image from bucket..."
echo ""
aws s3 rm s3://tech242-fergus-first-bucket/dog.jpg
echo ""
echo "Image deleted successfully from bucket"
echo ""

## Delete bucket with files contained within
echo "Deleting bucket if one already exists..."
echo ""
aws s3 rb s3://tech242-fergus-first-bucket --force
echo ""
echo "Bucket deleted successfully"
echo ""

## Move into the correct folder
echo "Moving into correct folder..."
echo ""
cd ../../../..
echo "Successfully moved into correct folder"
echo ""

## MVN Package
echo "Running Maven Package..."
echo ""
sudo mvn package
echo ""
echo "Maven Package run successfully"
echo ""