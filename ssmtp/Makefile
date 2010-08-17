install:
ifeq ($(MODE), global)
	m4 ssmtp.conf.m4 > ssmtp.conf
	m4 revaliases.m4 > revaliases
	$(SUDO) mv ssmtp.conf /etc/ssmtp/
	$(SUDO) mv revaliases /etc/ssmtp/
else
	@echo local mode, skipping
endif

clean:
ifeq ($(MODE), global)
	$(SUDO) rm /etc/ssmtp/ssmtp.conf
	$(SUDO) rm /etc/ssmtp/revaliases
else
	@echo local mode, skipping
endif
