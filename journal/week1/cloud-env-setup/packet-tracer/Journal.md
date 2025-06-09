# 🧪 State of the Network – Packet Tracer Simulation

While exploring Cisco Packet Tracer, I built and simulated a basic switched network consisting of a PC, a server, a switch, and a router. The objective was to validate DHCP behavior, packet flow, and basic connectivity.


## 🖼️ Network Topology

![Network Topology](./assests/state_of_network.png)

Devices used:

- PC0: Client machine
- Server0: Acting as DHCP and DNS server
- Switch0 (2960): Layer 2 switch connecting all devices
- Router0 (ISR 4331): Layer 3 device for routing (not yet fully configured)

## DHCP Simulation

Inside the PC0 Command Prompt, I executed:

```cmd
ipconfig /renew
```