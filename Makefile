MODE ?= global

CFG_OS=linux
CFG_ZSH_ROOT=/etc/zsh

ifeq ($(MODE), global)
SUDO=sudo
endif

screen-vars:
override screen_src = screen/screenrc
ifeq ($(MODE), local)
override screen_dst = ~/.screenrc
else
override screen_dst = /etc/screenrc
endif

screenrc: screen-vars
	$(SUDO) cp $(screen_src) $(screen_dst)

screenrc-clean: screen-vars
	$(SUDO) rm $(screen_dst)

zsh-vars:
override zsh_src = zsh/zshrc
ifeq ($(MODE), local)
override zsh_dst = ~/.zshrc
else
override zsh_dst = $(CFG_ZSH_ROOT)/zshrc
endif

zshrc: zsh-vars
	$(SUDO) cp $(zsh_src) $(zsh_dst)

zshrc-clean: zsh-vars
	$(SUDO) rm $(zsh_dst)


clean: screenrc-clean zshrc-clean

all: screenrc zshrc
