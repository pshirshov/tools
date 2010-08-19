install:
ifeq ($(MODE), global)
	$(M4) \
		ssmtp.conf.m4 > ssmtp.conf
	$(M4) \
		revaliases.m4 > revaliases
	$(SUDO) mv ssmtp.conf /etc/ssmtp/
	$(SUDO) mv revaliases /etc/ssmtp/
	echo "Testing mail on `hostname -a` (`uname -a`)" | mail -s "Test mail from `hostname -a`" root
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
