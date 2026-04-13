# Use a imagem oficial do Ubuntu como base
FROM ubuntu:latest

LABEL maintainer="Enterprise DevOps Team <devops@company.com>"

# update the package list and install necessary tools (wget, unzip, curl, git, openssh-client, iputils-ping)
RUN apt-get update && \
    apt-get install -y wget unzip curl git openssh-client iputils-ping

# terraform version to be installed
ENV TERRAFORM_VERSION=1.7.4

# download and install Terraform
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# create the /iac directory as a volume mount point
RUN mkdir /iac
VOLUME /iac

# Create the Downloads directory and install the AWS CLI
RUN mkdir Downloads && \
    cd Downloads && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

# Define the default command to run when the container is started
CMD ["/bin/bash"]
