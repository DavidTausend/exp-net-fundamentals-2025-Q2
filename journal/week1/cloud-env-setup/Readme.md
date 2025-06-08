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
### Run Deploy Script

```sh
cd journal/week1/cloud-env-setup
chmod u+x ./bin/deploy
./bin/deploy
```

You only have to chmod the file once to make it executable.

### Deploy with aws cli

 aws cloudformation create-stack \
  --stack-name my-vpc-stack \
  --template-body file://template.yml \
  --parameters \
      ParameterKey=AvailabilityZone,ParameterValue=eu-central-1a


```sh
```