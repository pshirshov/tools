export MODE ?= global
export CURRENT_USER = $(shell whoami)

CFG_OS := $(shell uname -s  | tr "[:upper:]" "[:lower:]" )
include config.$(CFG_OS)
TOOLS=screen zsh psql ssh $(ADDITIONAL_TOOLS)

ifeq ($(MODE), global)
SUDO ?= sudo
else
SUDO =
endif
export SUDO

M4BIN ?= m4
export M4=$(M4BIN) -I ../m4 -I ../settings \
-DCFG_OS=$(CFG_OS)

batch:
	@for tool in $(TOOLS);\
	do \
		echo "==============================================="; \
		echo "== PROCESSING: '$$tool'"; \
		echo "==============================================="; \
		cd $$tool && $(MAKE) $(TASK) && cd .. ; \
	done

clean-var:
TASK=clean

clean: clean-var batch

inst-var:
TASK=install

install: inst-var batch

