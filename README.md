# iac-emr-flink
 This lab will automate the configuration and management of the infrastructure needed to run batch and streaming data processing pipelines capable of handling large volumes of data with low latency.


# Instructions

Create Docker Image

``` 
docker build -t lab-terraform-image:lab-iac .
````



Create the Docker container

``` 
docker run -dit --name lab-iac -v ./IaC:/iac lab-terraform-image:lab-iac /bin/bash 
```


Check the Terraform and AWS CLI versions.

```
terraform version

aws --version 
```

Now that the terraform's machine is ready, let's go to the iac directory readme.
