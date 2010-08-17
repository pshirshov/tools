override screen_src = screenrc
ifeq ($(MODE), local)
override screen_dst = ~/.screenrc
else
override screen_dst = /etc/screenrc
endif

install:
	$(SUDO) cp -v $(screen_src) $(screen_dst)

clean:
	$(SUDO) rm $(screen_dst)
