# exp-net-fundamentals-2025-Q2

<h1 align="center">exp net fundamentals 2025 Q2</h1>

<img src="assets/readme/netz.webp" alt="A decorative picture featuring GenAI">

## Introduction

## Table of Contents

[Generate TOC](https://ecotrust-canada.github.io/markdown-toc/)

<br>

## Directory Structure

```bash
EXP-NET-FUNDAMENTALS-2025-Q2/
├── assets/
│   └── readme/
│       └── netz.webp
├── journal/
│   └── week1/
│       └── cloud-env-setup/
│           ├── bin/
│           │   └── deploy                        # Bash script to deploy CFN stack
│           ├── CFN/
│           │   └── template.yml                  # CloudFormation template
│           ├── terraform/
│           │   ├── .terraform/                   # Terraform working directory
│           │   ├── .terraform.lock.hcl
│           │   ├── backend.tf                    # Remote backend config
│           │   ├── keypair.tf                    # SSH key pair resource
│           │   ├── main.tf                       # Main VPC and network config
│           │   ├── network_interface.tf          # Network interface definitions
│           │   ├── outputs.tf                    # Output variables
│           │   ├── provider.tf                   # AWS provider config
│           │   ├── ubuntu_instance.tf            # Ubuntu EC2 instance config
│           │   ├── windows_instance.tf           # Windows EC2 instance config
│           │   └── variables.tf                  # Input variable declarations
│           └── Readme.md                         # Week 1 documentation
├── week2/
├── .gitignore
└── README.md                                     # Root project documentation
```
