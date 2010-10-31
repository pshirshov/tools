override xterm_src = XTerm
ifeq ($(MODE), local)
override xterm_dst = ~/.Xdefaults
else
override xterm_dst = /etc/X11/app-defaults/XTerm
endif

install:
	$(SUDO) mkdir -p /etc/X11/app-defaults
	$(SUDO) cp $(xterm_src) $(xterm_dst)

clean:
	$(SUDO) rm $(xterm_dst)
