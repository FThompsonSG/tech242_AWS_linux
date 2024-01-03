#!/bin/bash

## Install AWS command line interface and check version
sudo DEBIAN_FRONTEND=noninteractive apt install awscli -y
aws --version

## Logging in to AWS
aws configure

## Delete bucket with files contained within
aws s3 rb s3://tech242-fergus-first-bucket --force

## Make a bucket
aws s3 mb s3://tech242-fergus-first-bucket

## Download image from source URL
curl -o dog.jpg "https://www.shutterstock.com/image-illustration/monstrous-zombie-hound-3d-illustration-260nw-1777548596.jpg"

## Upload file to bucket
aws s3 cp dog.jpg s3://tech242-fergus-first-bucket

## Modify block public access settings
aws s3api put-public-access-block \
  --bucket tech242-fergus-first-bucket \
  --public-access-block-configuration '{
    "BlockPublicAcls":true,
    "IgnorePublicAcls":true,
    "BlockPublicPolicy":true,
    "RestrictPublicBuckets":true
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

