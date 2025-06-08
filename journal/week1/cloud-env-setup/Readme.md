## How to Deploy

### Check your AWS Account

```sh
aws sts get-caller-identity
```


### Terraform Deployment

```sh
tf init
tf plan
tf -auto-approve
```

### Deploy with aws cli

 aws cloudformation create-stack \
  --stack-name my-vpc-stack \
  --template-body file://template.yml \
  --parameters \
      ParameterKey=AvailabilityZone,ParameterValue=eu-central-1a

### Run Deploy Script

```sh
cd journal/week1/cloud-env-setup
chmod u+x ./bin/deploy
./bin/deploy
```

You only have to chmod the file once to make it executable.

### Rollback deployment

```sh
cd journal/week1/cloud-env-setup
chmod +x ./bin/rollback.sh
./bin/rollback.sh
```

You only have to chmod the file once to make it executable.

## Summary

•	✅ Installed AWS CLI and configured credentials
•	✅ Set up remote Terraform backend with S3 and DynamoDB
•	✅ Generated and deployed a VPC using both Terraform and CloudFormation
•	✅ Visualized infrastructure using AWS Composer
•	⚠️ Resolved minor dependency issues during provisioning