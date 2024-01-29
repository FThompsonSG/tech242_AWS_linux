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

# S3 Durability and Availabilty

## Durability
- High durability (99.999999999%, eleven 9's) of objects across multiple AZ
- If you store 10,000,000 objects with Amazon S3, you can on average expect to incur a loss of a single object once every 10,000 years
- Same for all storage classes

## Availabilty
- Measures how readily available a service is
- Varies depending on storage class
- Example: S3 standard has 99.99% availability = not available 53 minutes a year

# S3 Storage Classes

## Amazon S3 Standard - General Purpose
- 99.99% availability
- Used for frequently accessed data
- Low l;atency and high throughput
- Sustain 2 concurrent facility failures
- Use cases: Big Data analytics, mobile and gaming applications, content distribution etc...

## Amazon S3 Infrequent Access (IA)
- For data that is less frequently accessed but requires rapid access when needed
- Lower cost than S3 standard but incurs a cost when accessed

- Amazon S3 Standard - Infrequent Access
  - 99.9% availability
  - Use cases: Disaster recovery, backups
  
- Amazon S3 One Zone - Infequent Access
  - High durability (99.999999999%) in a single AZ; data lost when AZ is destroyed
  - 99.5% availability
  - Use cases: Storing secondary backup copies of on-premise data, or data you can recreate

## Amazon S3 Glacier
- Low-cost object storage meant for archiving/backup
- Pricing: price for storage + object retrieval cost

- Amazon S3 Glacier Instant Retrieval
  - Millisecond retrieval, great for data accessed once a quarter
  - Minimum storage duration of 90 days

- Amazon S3 Glacier Flexible Retrieval
  - Expedited (1 to 5 minutes), Standard (3 to 5 hours), Bulk (5 to 12 hours) - free
  - Minimum storage duration of 90 days

- Amazon S3 Glacier Deep Archive
  - Standard (12 hours) or Bulk (48 hours)
  - Minimum storage duration of 180 days

## Amazon S3 Intelligent-Tiering
- Small monthly monitoring and auto-tiering fee
- Moves objects automatically between Access Tiers based on usage
- There are no retrieval charges in S3 Intelligent-Tiering

- Frequent Access tier (automatic): default tier
- Infrequent Access tier (automatic): objects not accessed for 30 days
- Archive Instant Access tier (automatic): objects not accessed for 90 days
- Archive Access tier (optional): configurable from 90 days to 700+ days
- Deep Archive Access tier (optional): configurable from 180 days to 700+ days