# Hello World Terraform

## Introduction

Hello World example using Terraform

## Contents

- [Setup](#setup)
- [Usage](#usage)

## Setup

- Install Terraform
- Create a KeyPair in AWS. You can save it: `~/.ssh/test-keypair.pem`. Then run:

```bash
chmod 600 ~/.ssh/test-keypair.pem
ssh-keygen -y -f ~/.ssh/test-keypair.pem > ~/.ssh/test-keypair.pub
```

## Usage

```bash
# Install the plugins
terraform init

# See the terraform plan
AWS_ACCESS_KEY_ID=AAK_HERE AWS_SECRET_ACCESS_KEY=ASAK_HERE terraform plan

# Apply the terraform plan
AWS_ACCESS_KEY_ID=AAK_HERE AWS_SECRET_ACCESS_KEY=ASAK_HERE terraform apply
```
