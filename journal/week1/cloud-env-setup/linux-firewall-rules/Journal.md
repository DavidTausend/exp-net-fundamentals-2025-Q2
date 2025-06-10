# 🔥 Linux Firewall Rules on AWS

This documentation describes a practical experiment using iptables to control traffic on an AWS-hosted Linux instance.

![](./assets/python_server.png)
![](./assets/hello_world.png)
![](./assets/ip_table.png)
![](./assets/iptables.png)

---

## 🗺️ Network Topology

![Proof of Work - Curl Success & Server Response](./assets/linux_proof_work.png)

We used an AWS EC2 instance running Ubuntu, configured a local web server with Python, and tested both  AWS Security Group rules*and Linux-level iptables rules.


## 🎯 Goal

Evaluate how easy or difficult it is to manage firewall rules at two levels:

- 🌐 Cloud-level: AWS Security Groups  
- 🧱 Host-level: Linux iptables


## 🧠 Considerations

- Instance: Ubuntu (latest) running on AWS EC2 in `eu-central-1`
- Tools:
  - `iptables` (already installed)
  - `python3` (already installed)
- We avoided using `ufw` to get hands-on experience with raw `iptables` usage.

---

## 🔎 Investigation Summary

- `iptables` was accessible via CLI  
- We avoided editing `/etc/iptables/rules.v4` directly, instead using runtime commands  
- We successfully hosted a Python web server and validated access externally via `curl` and browser

---

## 🧪 Setup and Testing

### 1️⃣ Start a Simple Python Web Server

```bash
mkdir www && cd www
echo "<h1 style='color:red;'>Hello World!</h1>" > index.html
python3 -m http.server 8000
```


### Access Server via Browser

```bash
http://<Public-IP>:8000
```

This confirms that AWS Security Group and OS-level firewall both allowed traffic on port 8000.

### IPTables Rule Management

Drop Port 8000 from External Sources

```bash
sudo iptables -A INPUT -p tcp --dport 8000 ! -s 127.0.0.1 -j DROP
```

This blocked external access to the server while allowing localhost.

### Redirect Port 7000 to 8000

```bash
sudo iptables -t nat -A PREROUTING -p tcp --dport 7000 -j REDIRECT --to-port 8000
```

This rule redirected incoming traffic from port 7000 to 8000.

### Curl Test From Local Machine

```bash
curl http://<Public-IP>:7000 --connect-timeout 2
```

We successfully reached the Python server via redirected port 7000.