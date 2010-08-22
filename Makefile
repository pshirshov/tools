export MODE ?= global
export CURRENT_USER = $(shell whoami)

include environment

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

batch:
	@export terminal_width=`tput cols`
	@for tool in $(TOOLS);\
	do \
		#for (( i=0 ; i<$terminal_width ; i++ )); do echo -n "-" ; done; \
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

