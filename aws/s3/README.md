## Install AWS command line interface and check version
echo "Installing AWS Command Line Interface..."
echo ""
sudo DEBIAN_FRONTEND=noninteractive apt install awscli -y
echo ""
echo "AWS Command Line Interface installed."
echo ""
echo "Confirming AWS Command Line Interface version..."
echo ""
aws --version
echo ""

## Logging in to AWS
echo "Configuring AWS..."
echo ""
aws configure
echo ""
echo "AWS configured successfully"
echo ""

## List all buckets
aws s3 ls

## Make a bucket
aws s3 mb s3://tech242-fergus-first-bucket

## List all files in bucket
aws s3 ls s3://tech242-fergus-first-bucket

## Print to console and create file with printed contents
echo This is the first line in a test file > test.txt

## Upload file to bucket
aws s3 cp test.txt s3://tech242-fergus-first-bucket

## Download files from bucket to current directory
aws s3 sync s3://tech242-fergus-first-bucket .

## Delete specific file from bucket
aws s3 rm s3://tech242-fergus-first-bucket/test.txt

## Delete all files in bucket
aws s3 rm s3://tech242-fergus-first-bucket --recursive

## Delete empty bucket
aws s3 rb s3://tech242-fergus-first-bucket

## Delete bucket with files contained within
aws s3 rb s3://tech242-fergus-first-bucket --force

## Correct location to amend contents of file
cd src/main/resources/templates/

## Update home screen after making change
sudo mvn package

Bucket Object Permission
1. Edit block public access, then uncheck and save
2. ACL - Bucket ownership, enable, acknowledge then save
3. Objects - Check object, click actions, make public via ACL then make public on pop up window