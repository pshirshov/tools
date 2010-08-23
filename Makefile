export MODE ?= global
export CURRENT_USER = $(shell whoami)

include environment.make

CFG_OS := $(fw_cfg_os)

SUDO=$(fw_cfg_sudo)

ifeq ($(MODE), global)
SUDO ?= sudo
else
SUDO =
endif
export SUDO

ifeq ($(fw_cfg_os), linux)
ADDITIONAL_TOOLS := ssmtp
endif

TOOLS=screen zsh psql ssh $(ADDITIONAL_TOOLS)

M4BIN ?= $(fw_cfg_m4)

export M4=$(M4BIN) -I ../m4 -I ../settings \
-DCFG_OS=$(CFG_OS)
console_width=$(shell tput cols)

batch:
	@for tool in $(TOOLS);\
	do \
		for i in `seq 2 $(console_width)`; do echo -n "=" ; done; \
		echo "=" ; \
		echo "== PROCESSING: '$$tool'"; \
		for i in `seq 2 $(console_width)`; do echo -n "=" ; done; \
		echo "=" ; \
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

