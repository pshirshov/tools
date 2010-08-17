override psql_src = psqlrc
ifeq ($(MODE), local)
override psql_dst = ~/.psqlrc
else
override psql_dst = $(CFG_PG_ROOT)/psqlrc
endif

install:
	mkdir ~/.psql
	$(SUDO) cp $(psql_src) $(psql_dst)

clean:
	$(SUDO) rm $(psql_dst)
