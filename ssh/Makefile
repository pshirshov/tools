SFTP_BINARY=$(shell find /usr -name sftp-server -print 2>/dev/null|head -n 1)
SSHD_BINARY=$(shell find /usr -name sshd -print 2>/dev/null|head -n 1)

install:
ifeq ($(MODE), global)
	@echo "sftp binary: '$(SFTP_BINARY)'" 
	@echo "sftp binary: '$(SSHD_BINARY)'" 
	[ -f $(SFTP_BINARY) ]
	$(M4) \
		-DSFTP_BINARY=$(SFTP_BINARY) \
		sshd_config.m4 > sshd_config
	$(SUDO) $(SSHD_BINARY) -t -f sshd_config
	$(SUDO) mv sshd_config /etc/ssh/
else
	@echo local mode, skipping
endif

clean:
ifeq ($(MODE), global)
	$(SUDO) rm /etc/ssh/sshd_config
else
	@echo local mode, skipping
endif
