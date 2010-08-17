include(../settings.ssmtp.m4)dnl
# sSMTP aliases
# 
# Format:       local_account:outgoing_address:mailhub
#
# Example: root:your_login@your.domain:mailhub.your.domain[:port]
# where [:port] is an optional port number that defaults to 25.
root:SMTP_LOGIN:SMTP_SERVER:SMTP_PORT
