# 🔒 Firewall Rules Testing (Local and Cloud)

## 🧪 Local Firewall Testing Challenges

When testing firewall behavior **locally** (e.g., using `localhost`), it's important to note:

- Localhost traffic bypasses firewall rules in many operating systems.
- Most firewall rules do not block loopback interface (`127.0.0.1`) traffic.
- Therefore, realistic testing requires accessing the service from a different machine on the network or from the internet.

## ☁️ Azure Windows Web Server

To validate firewall rules in a cloud environment, we deployed a Windows Server VM on Azure and hosted a basic HTTP server using Python.

![Windows Firewall proof work](assets/win_firewall.png)