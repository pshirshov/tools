ifeq ($(fw_cfg_os), linux)
override CFG_ZSH_ROOT=/etc/zsh
else
override CFG_ZSH_ROOT=/etc
endif

override zsh_src = zshrc

ifeq ($(MODE), local)
override zsh_dst = ~/.zshrc
else
override zsh_dst = $(CFG_ZSH_ROOT)/zshrc
endif

install:
	@echo "ZSH config root: $(CFG_PG_ROOT)"
	$(SUDO) cp $(zsh_src) $(zsh_dst)
ifeq ($(MODE), global)
	$(SUDO) usermod -s `which zsh` $(CURRENT_USER)
	$(SUDO) usermod -s `which zsh` `whoami`
else
	@echo local mode, skipping shell updates
endif

clean:
	$(SUDO) rm $(zsh_dst)
