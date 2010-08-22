ifeq ($(fw_cfg_os), linux)
override CFG_PG_ROOT=$(shell pg_config --sysconfdir)
else
export CFG_PG_ROOT=$(shell /usr/postgres/8.3/bin/pg_config --sysconfdir)
endif

override psql_src = psqlrc
ifeq ($(MODE), local)
override psql_dst = ~/.psqlrc
else
override psql_dst = $(CFG_PG_ROOT)/psqlrc
endif

install:
	@echo "PG config root: $(CFG_PG_ROOT)"
	mkdir -p ~/.psql
	$(SUDO) cp $(psql_src) $(psql_dst)

clean:
	$(SUDO) rm $(psql_dst)
