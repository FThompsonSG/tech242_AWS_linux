#!/bin/bash

## Make a bucket
echo "Creating new bucket..."
echo ""
aws s3 mb s3://tech242-fergus-first-bucket
echo ""
echo "Bucket created successfully"
echo ""

## Download image from source URL
echo "Downloading image..."
echo ""
curl -o dog.jpg "https://www.shutterstock.com/image-illustration/monstrous-zombie-hound-3d-illustration-260nw-1777548596.jpg"
echo ""
echo "Image downloaded successfully"
echo ""

## Upload file to bucket
echo "Uploaing image to bucket..."
echo ""
aws s3 cp dog.jpg s3://tech242-fergus-first-bucket
echo ""
echo "Image uploaded successfully"
echo ""

## Modify block public access settings
echo "Modifying permissions and access settings on AWS S3 bucket..."
echo ""
aws s3api put-public-access-block \
  --bucket tech242-fergus-first-bucket \
  --public-access-block-configuration '{
    "BlockPublicAcls":false,
    "IgnorePublicAcls":false,
    "BlockPublicPolicy":false,
    "RestrictPublicBuckets":false
  }'

## Enable object ownership for bucket
aws s3api put-bucket-ownership-controls \
    --bucket tech242-fergus-first-bucket \
    --ownership-controls '{
        "Rules": [
            {
                "ObjectOwnership": "BucketOwnerPreferred"
            }
        ]
    }'

## Making image public via ACL
aws s3api put-object-acl \
    --bucket tech242-fergus-first-bucket \
    --key dog.jpg \
    --acl public-read
echo "AWS S3 bucket permissions and access settings successfully updated"
echo ""

## Move into the correct folder
echo "Moving into correct folder..."
echo ""
cd /repo/springapi/src/main/resources/templates
echo "Successfully moved into correct folder"
echo ""

## Replace current home page image with new image
echo "Updating image on home page..."
sudo sed -i 's|<img src="/images/friday13th.jpg" alt="friday13thposter">|<img src="https://tech242-fergus-first-bucket.s3.eu-west-1.amazonaws.com/dog.jpg" alt="scary-dog-image">|g' home.html
echo ""
echo "Image updated successfully"
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