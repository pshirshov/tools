override zsh_src = zshrc
ifeq ($(MODE), local)
override zsh_dst = ~/.zshrc
else
override zsh_dst = $(CFG_ZSH_ROOT)/zshrc
endif

install:
	$(SUDO) cp $(zsh_src) $(zsh_dst)

clean:
	$(SUDO) rm $(zsh_dst)