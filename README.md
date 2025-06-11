# exp-net-fundamentals-2025-Q2

<h1 align="center">exp net fundamentals 2025 Q2</h1>

<img src="assets/readme/netz.webp" alt="A decorative picture featuring GenAI">

## Introduction

This repo is my journey through the Network Fundamentals Bootcamp (Q2 2025) and hands-on experience across AWS, Azure, and real/local networking labs.  

## Table of Contents

[Generate TOC](https://ecotrust-canada.github.io/markdown-toc/)

<br>

## 📁 Directory Structure

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

## 🔗 Quick Links to Journals & Docs

### ☁️ Week 1 – Cloud Setup
- 📓 [Week 1 Journal](journal/week1/cloud-env-setup/Journal.md)
- 📘 [Week 1 Readme](journal/week1/cloud-env-setup/Readme.md)

### 🧱 Azure & Bicep
- 📄 [parameters.json](journal/week1/cloud-env-setup/ip-address-management/templates/vm/parameters.json)
- 📄 [template.bicep](journal/week1/cloud-env-setup/ip-address-management/templates/vm/template.bicep)
- 📄 [template.json](journal/week1/cloud-env-setup/ip-address-management/templates/vm/template.json)

### 🧯 Linux Firewall Rules
- 🔥 [Linux Firewall Journal](journal/linux-firewall-rules/Journal.md)

### 🧪 Linux Networking
- 🌐 [Linux Networking Journal](journal/linux-networking/Journal.md)

### 🪟 Windows Firewall Rules
- 📓 [Windows Firewall Journal](journal/windows-firewall-rules/Journal.md)
- 📘 [Windows Firewall Readme](journal/windows-firewall-rules/Readme.md)
- 🌍 [Test Page: index.html](journal/windows-firewall-rules/index.html)

### 🪟 Windows Networking
- 📓 [Windows Networking Journal](journal/windows-networking/Journal.md)
- 📘 [Windows Networking Readme](journal/windows-networking/Readme.md)

### 📡 Cisco Packet Tracer
- 🧠 [Packet Tracer Journal](journal/packet-tracer/Journal.md)