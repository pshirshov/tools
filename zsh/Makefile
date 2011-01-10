ifeq ($(fw_cfg_os), linux)
override CFG_ZSH_ROOT=/etc/zsh
else
override CFG_ZSH_ROOT=/etc
endif

override zsh_src = zshrc
ifeq ($(fw_cfg_distro), gentoo)
override zsha_src = aliases
endif

ifeq ($(MODE), local)
override zsh_dst = ~/.zshrc
else
override zsh_dst = $(CFG_ZSH_ROOT)/zshrc
override zsha_dst = /etc/zsh-aliases
endif

install:
	@echo "ZSH config root: $(CFG_PG_ROOT)"
	$(SUDO) cp $(zsh_src) $(zsh_dst)
ifeq ($(MODE), global)
ifeq ($(zsha_src), )
	@echo unknown distro, skipping aliases
else
	$(SUDO) cp $(zsha_src) $(zsha_dst)
endif
	$(SUDO) usermod -s `which zsh` $(CURRENT_USER)
	$(SUDO) usermod -s `which zsh` `whoami`
else
	@echo local mode, skipping shell updates
endif

clean:
	$(SUDO) rm $(zsh_dst)
