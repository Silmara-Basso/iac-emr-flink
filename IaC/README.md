# Lab IAC ERM - Provisioning Data Processing Infrastructure with AWS EMR and Apache Flink

Create an S3 bucket named lab-iac-account-id (replace account-id) and configure it in the emr.tf file.

Initialize Terraform
````
terraform init
````

Create the plan and save it to disk.
```
terraform plan -var-file config.tfvars -out terraform.tfplan
```

Executes the apply command with the variables file.
````
terraform apply -var-file config.tfvars
````
### Verify the created cluster, and then you can test the HDFS and Flink functionalities.


The cluster's private key will be in generated.

Copy the job/iac.txt file into the S3 bucket.
Replace (cluster-id) and (account-id), and run the following instruction via AWS CLI.


```
aws emr add-steps --cluster-id <cluster-id> \
--steps Type=CUSTOM_JAR,Name=Job2_P1,Jar=command-runner.jar,\
Args="flink","run","-m","yarn-cluster",\
"/usr/lib/flink/examples/streaming/WordCount.jar",\
"--input","s3://lab-iac-<account-id>/iac.txt","--output","s3://lab-iac-<account-id>/" \
--region us-east-2
```

### Finally, destroy everything using the instructions below.

Create the plan for the destroy operation and save it to disk.
```
terraform plan -destroy -var-file config.tfvars -out terraform.tfplan
```


Run destroy
```
terraform apply terraform.tfplan
```

