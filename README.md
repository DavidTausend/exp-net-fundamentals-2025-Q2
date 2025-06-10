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
│
├── journal/
│   ├── week1/
│   │   └── cloud-env-setup/
│   │       ├── bin/
│   │       │   ├── deploy                        # Bash script to deploy resources
│   │       │   └── rollback                      # Script to tear down resources
│   │       ├── CFN/
│   │       │   └── template.yml                  # CloudFormation template
│   │       ├── ip-address-management/
│   │       │   └── templates/vm/
│   │       │       ├── parameters.json           # Parameters for Bicep deployment
│   │       │       ├── template.bicep            # Azure Bicep template
│   │       │       └── template.json             # Original ARM template
│   │       ├── Journal.md                        # Cloud setup journal
│   │       └── Readme.md                         # Cloud setup documentation
│   ├── linux-firewall-rules/
│   │   └── Journal.md                            # Linux iptables & firewall lab notes
│   ├── linux-networking/
│   │   └── Journal.md                            # Linux networking journal
│   ├── windows-firewall-rules/
│   │   ├── index.html                            # Sample HTML file for firewall test
│   │   ├── Journal.md                            # Windows firewall lab journal
│   │   └── Readme.md                             # Windows firewall documentation
│   ├── windows-networking/
│   │   ├── Journal.md                            # Windows networking journal (copy 1)
│   │   ├── Journal.md                            # Windows networking journal (copy 2)
│   │   └── Readme.md                             # Windows networking documentation
│   └── Journal.md                                # General-purpose journal (root of journal folder)
│
├── terraform/                                     # Terraform folder (structure not shown)
│
├── week2/
│
├── .gitignore
└── README.md                                      # Root documentation
```