export MODE ?= global

CFG_OS := $(shell uname -s  | tr "[:upper:]" "[:lower:]" )
include config.$(CFG_OS)

ifeq ($(MODE), global)
SUDO ?= sudo
else
SUDO =
endif
export SUDO

TOOLS=screen zsh psql $(ADDITIONAL_TOOLS)

batch:
	@for tool in $(TOOLS);\
	do \
		echo "==============================================="; \
		echo "== PROCESSING: '$$tool'"; \
		echo "==============================================="; \
		echo `pwd` && cd $$tool && $(MAKE) $(TASK) && cd .. ; \
	done

clean-var:
TASK=clean

clean: clean-var batch

inst-var:
TASK=install

install: inst-var batch

