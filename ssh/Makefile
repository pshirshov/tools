SSHD_BINARY=$(shell echo "which sshd 1>/dev/null && which sshd" | $(SUDO) su)
SFTP_BINARY=$(shell echo "which sftp-server 1>/dev/null && which sftp-server" | $(SUDO) su)

ifeq ($(SSHD_BINARY), )
$(shell echo "searching for sshd" >&2)
SSHD_BINARY=$(shell find /usr -name sshd -print 2>/dev/null | grep -v logwatch | head -n 1)
endif

ifeq ($(SFTP_BINARY), )
$(shell echo "searching for sftp-server" >&2)
SFTP_BINARY=$(shell find /usr -name sftp-server -print 2>/dev/null| grep -v logwatch | head -n 1)
endif

install:
ifeq ($(MODE), global)
	@echo "sftp binary: '$(SFTP_BINARY)'" 
	@echo "sftp binary: '$(SSHD_BINARY)'" 
	[ -f $(SFTP_BINARY) ]
	[ -f $(SSHD_BINARY) ]
	$(M4) \
		-DSFTP_BINARY=$(SFTP_BINARY) \
		sshd_config.m4 > sshd_config
	$(SUDO) $(SSHD_BINARY) -t -f sshd_config
	$(SUDO) cp sshd_config /etc/ssh/
else
	@echo local mode, skipping
endif

clean:
ifeq ($(MODE), global)
	$(SUDO) rm /etc/ssh/sshd_config
else
	@echo local mode, skipping
endif
