## DNS Resolver Check

We’re using systemd-resolved to manage DNS on this Linux instance. After making changes to /etc/systemd/resolved.conf (like adding DNS=1.1.1.1), we restarted the service with:

```sh
sudo systemctl restart systemd-resolved
```
we checked the resolver status:

```sh
resolvectl status
```

![](./assests/resolver.png)


## wget vs curl

Both commands are to download files on linux but curl can do transfer data with API calls like GET/POST

### Downloading a file

We tried both tools to download the same image from a Google Image redirect URL.

```sh
wget "https://www.google.com/imgres?q=exampro&imgurl=..."
```

This saved the file to the default output and logged the result in wget-log.

```sh
curl -O "https://www.google.com/imgres?q=exampro&imgurl=..."
```

Used the -O flag to save the file with the original filename.