# Week 2 – Cisco Modeling Labs (CML)

This week I explored Cisco Modeling Labs (CML), a powerful network simulation tool provided by Cisco for designing, building, and testing network topologies in a virtual environment.

## Environment

- System Operater: macOS with Apple Silico
- Tool Attempted: UTM (to virtualize CML ISO)

## Installation Attempt

I attempted to install Cisco Modeling Labs using UTM on my Mac, but encountered hardware compatibility issues. CML requires certain CPU extensions and resources that are currently unsupported or limited under UTM on macOS ARM.

Due to these hardware requirements, I was unable to successfully install and run CML in my local environment.

![](assets/utm.png)

## Traffic Flow with Wireshark

I download the application to analyzing live network traffic using on my mac. I captured packets from the Wi-Fi: en0 interface to observe real-time traffic patterns, protocols, and data transfer behaviors.

![](assets/wireshark.png)

## VPN

Virtual Private Networks are they are used to securely connect remote networks or users over the public internet, in this case was used between CML and AWS.

![](assets/custom_gateway.png)
![](assets/vgw.png)

## NAT

which is a method used in networking to map internal private IP addresses to a external public IP address before packets are forwarded across a router or firewall.


## Load Balancer

Load balancers distribute network or application traffic across multiple servers to improve responsiveness and reliability.

### Types:
- Layer 4 (Transport): Balances based on IP and TCP/UDP ports
- Layer 7 (Application): Balances based on content, headers, etc.

## Reverse Proxy

It sits in front of one or more backend servers and forwards client requests to them.

## Forward Proxy

It acts as an intermediary between clients and the internet.

## HA Proxy

It is a high-performance TCP/HTTP load balancer and reverse proxy.


## Pomerium

It is a modern reverse proxy focused on identity-aware access control.

![](assets/pomerium.png)
![](assets/pomerium2.png)

### Router Problems

During my local testing, I encountered an issue with port forwarding. My internet provider’s router (ISP-managed) had limited configuration capabilities, which made it impossible to forward external traffic to my local machine.
