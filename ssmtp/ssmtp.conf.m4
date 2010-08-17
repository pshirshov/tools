include(../settings.ssmtp.m4)dnl
# The person who gets all mail for userids < 1000
# Make this empty to disable rewriting.
root=ROOT_ADDRESS

mailhub=SMTP_SERVER:SMTP_PORT
AuthUser=SMTP_LOGIN@SMTP_DOMAIN
AuthPass=SMTP_PASSWORD
UseSTARTTLS=yes

# Where will the mail seem to come from?
rewriteDomain=SMTP_DOMAIN

# The full hostname

# Gentoo bug #47562
# Commenting the following line will force ssmtp to figure
# out the hostname itself.

# hostname=_HOSTNAME_

# Set this to never rewrite the "From:" line (unless not given) and to
# use that address in the "from line" of the envelope.
#FromLineOverride=YES

# Use SSL/TLS to send secure messages to server.
UseTLS=YES

# Use SSL/TLS certificate to authenticate against smtp host.
#UseTLSCert=YES

# Use this RSA certificate.
#TLSCert=/etc/ssl/certs/ssmtp.pem

# Get enhanced (*really* enhanced) debugging information in the logs
# If you want to have debugging of the config file parsing, move this option
# to the top of the config file and uncomment
Debug=YES
