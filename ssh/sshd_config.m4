Protocol 2
KeepAlive yes
ifelse(CFG_OS, `sunos', `', `TCPKeepAlive yes')
Compression yes

LoginGraceTime 600
StrictModes yes
UsePrivilegeSeparation yes

# Useful prints
PrintLastLog yes
PrintMotd no

# Keys && regeneraion
HostKey /etc/ssh/ssh_host_rsa_key
HostKey /etc/ssh/ssh_host_dsa_key
KeyRegenerationInterval 3600
ServerKeyBits 2048

# Logging
SyslogFacility AUTH
LogLevel INFO

# Authentication:
MaxAuthTries    4
#MaxSessions 10
ifelse(CFG_OS, `sunos', `MaxAuthTriesLog 2', `')

RSAAuthentication yes
PubkeyAuthentication yes
#AuthorizedKeysFile     .ssh/authorized_keys

PermitRootLogin no
PermitEmptyPasswords no
RhostsRSAAuthentication no
HostbasedAuthentication no
IgnoreRhosts yes
PasswordAuthentication no
ChallengeResponseAuthentication no
ifelse(CFG_OS, `sunos', `', `KerberosAuthentication no')
GSSAPIAuthentication no
PAMAuthenticationViaKBDInt no
ifelse(CFG_OS, `sunos', `', `UsePAM no')

# Tunnels
AllowTcpForwarding no
GatewayPorts no
ifelse(CFG_OS, `sunos', `', `PermitTunnel no')

# X11 tunneling options
X11Forwarding yes
X11DisplayOffset 10
X11UseLocalhost yes

Subsystem       sftp    SFTP_BINARY
# 
include(`foreach.m4')dnl
include(`settings.ssh.m4')dnl
# Listening
Port SSHD_PORT
ifelse(CFG_OS, `sunos', `#', `')ifelse(SSHD_IPV4_ONLY, `yes', `AddressFamily inet', `') 
foreach(SSHD_IFACE, SSHD_LISTEN, `ListenAddress SSHD_IFACE
')dnl

# Allowed users
foreach(SSHD_USER, SSHD_USERS, `AllowUsers SSHD_USER
')dnl
