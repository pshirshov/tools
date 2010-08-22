export MODE ?= global
export CURRENT_USER = $(shell whoami)

CFG_OS := $(fw_cfg_os)

include config.$(CFG_OS)

SUDO=$(fwr_cfg_sudo)

ifeq ($(MODE), global)
SUDO ?= sudo
else
SUDO =
endif
export SUDO

TOOLS=screen zsh psql ssh $(ADDITIONAL_TOOLS)

M4BIN ?= $(fwr_cfg_gnum4)

export M4=$(M4BIN) -I ../m4 -I ../settings \
-DCFG_OS=$(CFG_OS)

batch:
	@for tool in $(TOOLS);\
	do \
		echo "==============================================="; \
		echo "== PROCESSING: '$$tool'"; \
		echo "==============================================="; \
		cd $$tool ; \
		$(MAKE) $(TASK) || exit 1; \
		cd .. ; \
	done

clean-var:
TASK=clean

clean: clean-var batch

inst-var:
TASK=install

install: inst-var batch

