# 💻 Developer Environment – AWS Windows Instance Networking

This documentation outlines the network configuration and diagnostic tests performed on a Windows Server 2025 EC2 instance in AWS. It includes IP configurations, DNS settings, and basic troubleshooting with `ipconfig`, `ping`, `tracert`, `netstat`, and routing commands.

---

## ☁️ Cloud Environment Overview

![AWS Instance Dashboard](./assets/aws_instances.png)  
![Windows Instance Details](./assets/win_instance.png)

The instance is hosted in AWS eu-central-1 (Frankfurt) region and is provisioned with:
- Two Elastic Network Interfaces (ENIs)
- Public/Private IP mappings
- DNS resolution support from AWS
- A subnet CIDR of `/26` (i.e., `255.255.255.192`)

## Ipconfig

```sh
ipconfig 
```
Windows IP Configuration


Ethernet adapter Ethernet:

   Connection-specific DNS Suffix  . : eu-central-1.compute.internal
   Link-local IPv6 Address . . . . . : fe80::c4cf:70bb:2026:d423%3
   IPv4 Address. . . . . . . . . . . : 10.200.123.33
   Subnet Mask . . . . . . . . . . . : 255.255.255.192
   Default Gateway . . . . . . . . . : 10.200.123.1

Ethernet adapter Ethernet 2:

   Connection-specific DNS Suffix  . : eu-central-1.compute.internal
   Link-local IPv6 Address . . . . . : fe80::99d3:e1a7:2e25:34b0%10
   IPv4 Address. . . . . . . . . . . : 10.200.123.83
   Subnet Mask . . . . . . . . . . . : 255.255.255.192
   Default Gateway . . . . . . . . . : 10.200.123.65

This Windows instance is multi-homed with two NICs in different subnets—commonly used for routing, segmentation, or redundancy testing.


```sh
ipconfig /all
```

Windows IP Configuration

   Host Name . . . . . . . . . . . . : EC2AMAZ-MLSMB4O
   Primary Dns Suffix  . . . . . . . :
   Node Type . . . . . . . . . . . . : Hybrid
   IP Routing Enabled. . . . . . . . : No
   WINS Proxy Enabled. . . . . . . . : No
   DNS Suffix Search List. . . . . . : ec2.internal
                                       us-east-1.ec2-utilities.amazonaws.com
                                       eu-central-1.compute.internal
                                       eu-central-1.ec2-utilities.amazonaws.com

Ethernet adapter Ethernet:

   Connection-specific DNS Suffix  . : eu-central-1.compute.internal
   Description . . . . . . . . . . . : Amazon Elastic Network Adapter
   Physical Address. . . . . . . . . : 02-7D-65-74-82-E9
   DHCP Enabled. . . . . . . . . . . : Yes
   Autoconfiguration Enabled . . . . : Yes
   Link-local IPv6 Address . . . . . : fe80::c4cf:70bb:2026:d423%3(Preferred)
   IPv4 Address. . . . . . . . . . . : 10.200.123.33(Preferred)
   Subnet Mask . . . . . . . . . . . : 255.255.255.192
   Lease Obtained. . . . . . . . . . : Monday, June 9, 2025 11:15:34 AM
   Lease Expires . . . . . . . . . . : Monday, June 9, 2025 12:15:35 PM
   Default Gateway . . . . . . . . . : 10.200.123.1
   DHCP Server . . . . . . . . . . . : 10.200.123.1
   DHCPv6 IAID . . . . . . . . . . . : 84821943
   DHCPv6 Client DUID. . . . . . . . : 00-01-00-01-2F-D8-7A-AE-02-7D-65-74-82-E9
   DNS Servers . . . . . . . . . . . : 10.200.123.2
   NetBIOS over Tcpip. . . . . . . . : Enabled

Ethernet adapter Ethernet 2:

   Connection-specific DNS Suffix  . : eu-central-1.compute.internal
   Description . . . . . . . . . . . : Amazon Elastic Network Adapter #2
   Physical Address. . . . . . . . . : 02-72-A2-F8-9D-FF
   DHCP Enabled. . . . . . . . . . . : Yes
   Autoconfiguration Enabled . . . . : Yes
   Link-local IPv6 Address . . . . . : fe80::99d3:e1a7:2e25:34b0%10(Preferred)
   IPv4 Address. . . . . . . . . . . : 10.200.123.83(Preferred)
   Subnet Mask . . . . . . . . . . . : 255.255.255.192
   Lease Obtained. . . . . . . . . . : Monday, June 9, 2025 11:15:34 AM
   Lease Expires . . . . . . . . . . : Monday, June 9, 2025 12:15:35 PM
   Default Gateway . . . . . . . . . : 10.200.123.65
   DHCP Server . . . . . . . . . . . : 10.200.123.65
   DHCPv6 IAID . . . . . . . . . . . : 167932578
   DHCPv6 Client DUID. . . . . . . . : 00-01-00-01-2F-D8-7A-AE-02-7D-65-74-82-E9
   DNS Servers . . . . . . . . . . . : 10.200.123.2
   NetBIOS over Tcpip. . . . . . . . : Enabled

The machine is auto-configured via DHCP, and DNS is internal to the VPC. Both adapters have preferred IPs and are functioning.


## Ipconfig release

```sh
ipconfig /release
```

## Ipconfig renew

```sh
ipconfig /renew
```

## Ipconfig flushdns

```sh
ipconfig /flushdns
```

## Ping

```sh
ping www.google.com
```

Pinging www.google.com [142.250.186.132] with 32 bytes of data:
Reply from 142.250.186.132: bytes=32 time<1ms TTL=117
Reply from 142.250.186.132: bytes=32 time<1ms TTL=117
Reply from 142.250.186.132: bytes=32 time<1ms TTL=117
Reply from 142.250.186.132: bytes=32 time<1ms TTL=117

Ping statistics for 142.250.186.132:
    Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),
Approximate round trip times in milli-seconds:
    Minimum = 0ms, Maximum = 0ms, Average = 0ms

Ping Successful: external DNS resolution and outbound internet access is working.

Proof that this EC2 instance can resolve DNS via AWS internal resolver and reach the public internet with a working default route.

## Tracerroute

```sh
tracert www.google.com
```
Shows hop-by-hop path to Google—useful for identifying delays or firewalls.

## nslookup

```sh
nslookup
```
Interactive DNS lookup tool to inspect DNS resolution path and verify server responses.


## Netstat

```sh
netstat
```

Active Connections

  Proto  Local Address          Foreign Address        State
  TCP    10.200.123.33:3389     p54b92cc9:49399        ESTABLISHED
  TCP    10.200.123.33:49829    172.211.123.249:https  ESTABLISHED
  TCP    10.200.123.33:49854    172.211.123.249:https  ESTABLISHED
  TCP    10.200.123.33:54114    a23-55-161-163:http    TIME_WAIT
  TCP    10.200.123.33:54119    172.184.231.71:https   TIME_WAIT
  TCP    10.200.123.33:54120    146.75.122.172:http    TIME_WAIT
  TCP    10.200.123.33:54121    20.190.160.17:https    ESTABLISHED
  TCP    10.200.123.33:54123    13.95.31.18:https      TIME_WAIT

The instance is actively communicating with cloud services and remote endpoints.


## Route

```sh
route
```
Use route manipulation to simulate segmented networks or test access to isolated subnets via different interfaces.


## Add a route

```sh
route ADD 157.0.0.0 MASK 255.0.0.0 10.200.123.1. IF 3
```


## Delete a route

```sh
route DELETE 157.0.0.0 MASK 255.0.0.0 10.200.123.1. IF 3
```

## Summary

•	🛠️ Dual-NIC Windows Server 2025 deployed in AWS
•	✅ DHCP, DNS, Gateway and Route Table working
•	🌍 External connectivity tested via ping
•	🧠 Useful environment for studying routing, diagnostics, and multi-NIC behavior