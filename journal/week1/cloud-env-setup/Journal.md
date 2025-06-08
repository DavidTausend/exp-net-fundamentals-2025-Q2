# 🧾 Week 1 – Cloud Environment Setup

This document outlines the steps, learnings, generated resources, and challenges encountered during Week 1 of the Network Fundamentals Bootcamp.

---

## Install AWS CLI

To deploy resources using the AWS CLI, install it first by following the official guide:
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html


## Configure AWS Credentials

Before proceeding, create an IAM user with programmatic access and appropriate permissions (e.g., `AmazonEC2FullAccess`, `AmazonS3FullAccess`, `AmazonDynamoDBFullAccess`).

![](assets/create_cli_user.webp)
![](assets/create_cli_user_permissions.webp)
![](assets/create_cli_user_review.webp)

Authenticate your AWS CLI session:
```bash
aws configure
```

Provide your:
	•	AWS Access Key ID
	•	AWS Secret Access Key
	•	Region (e.g. eu-central-1)
	•	Output format (you can leave blank or use json)


## Install Terraform

https://developer.hashicorp.com/terraform/install


## Set Up Terraform Remote Backend

### Create the S3 Bucket

⚠️ Ensure the bucket name is globally unique.

aws s3api create-bucket \
  --bucket network-bootcamp-tfstate-david-tausend \
  --region eu-central-1 \
  --create-bucket-configuration LocationConstraint=eu-central-1


### Create a DynamoDB Table

For state locking (avoids simultaneous edits):

aws dynamodb create-table \
  --table-name terraform-locks \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST
   

### Add a backend lock (backend.tf)

terraform {
  backend "s3" {
    bucket         = "network-bootcamp-tfstate-<your-unique-suffix>"
    key            = "vpc/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}


## To Convert .pem → .ppk

If using PuTTY on Windows:

puttygen nwbootcampkey-ppk-raw.pem -o nwbootcampkey-ppk.ppk

Note: I am using a MAC, so not needed.


## VPC Settings

There are the VPC Settings we observed Tim setup for our cloud environment in AWS:

 -VPC IPv4 CIDR Block: 10.200.123.0/24
 -Ipv6 CIRD Block: NO
 -Number of Azs: 1
 -Number of public subnets: 1
 -Number of private subnets: 1
 -NAT GATEWAY: None
 -VPC Endpoints: None
 -DNS Options: enable DNS Hostnames


## Generated terraform code

The terraform code was generated using hashicorp documentation with combination of LLM (ChatGPT) based on Tim's setup video. 

https://developer.hashicorp.com/terraform/language/providers/configuration


## Generated and Review CFN Template

The CloudFormation template was generated using an LLM (ChatGPT) based on Andrew's setup video.


## Gegerated Deploy Script

Using ChatGPT generated a bash script 'bin/deplpy'.

Note: Make sure to run chmod +x bin/deploy to make it executable.


## Visualization in Infrastructure Composer

![Generated with AWS Infrastructure Composer:](../../../assets/readme/aws_insfr_composer.webp)


## Deployed Resource to AWS

These visual outputs reflect the AWS resources deployed using the CloudFormation template:

![](assets/aws_vpc_resource_map.webp)
![](assets/cfn_resources.webp)


## Issues Encountered

### Content review

Due to time constraints, I did not fully complete the video content and I started with a Terraform based deployment and later switched to CloudFormation to save time. Although, I finished the setup using Terraform.

### Terraform setup

I encountered a dependency issue attaching an Elastic IP to the Windows instance.
To resolve it, I added an explicit depends_on block to control the resource provisioning order.