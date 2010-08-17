export MODE ?= global

CFG_OS := $(shell uname -s  | tr "[:upper:]" "[:lower:]" )
include config.$(CFG_OS)

ifeq ($(MODE), global)
SUDO ?= sudo
else
SUDO =
endif
export SUDO

TOOLS=screen zsh

batch:
	@for tool in $(TOOLS);\
	do \
		cd $$tool && $(MAKE) $(TASK) && cd .. ; \
	done

clean-var:
TASK=clean

clean: clean-var batch

inst-var:
TASK=install

install: inst-var batch

