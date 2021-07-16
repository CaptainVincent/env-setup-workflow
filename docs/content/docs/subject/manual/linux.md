---
title: "Linux Manual Setup"
weight: 1
---

# Pre-processing

## Change default user from `ubuntu` to any username
> You can choose the name to whatever you want

- Reset the password of ubuntu if we don't know ubuntu's password
```bash
sudo passwd
su
passwd -d ubuntu
exit
passwd
```

- Enable root login by ssh
```bash
sudo vim /root/.ssh/authorized_keys 
```
remove below line if root login is not allowed
```
no-port-forwarding,no-agent-forwarding,no-X11-forwarding,command="echo 'Please login as the user \"ubuntu\" rather than the user \"root\".';echo;sleep 10;exit 142"
```


- Rename username from ubuntu to `username` after re-login as root first
```bash
sudo usermod --login username --home /home/vincent -m ubuntu
```

## Add swap space for VPS through script
```bash
sudo chmod 500 setupSwap*
sudo ./setupSwap.sh
```

# Post-processing

## Change ssh port

```bash
sudo vim /etc/ssh/sshd_config
sudo ufw enable
sudo ufw allow 1985
sudo systemctl restart ssh.service
```