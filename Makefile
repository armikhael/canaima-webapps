# Makefile

SHELL := sh -e

SCRIPTS = "debian/preinst install" "debian/postinst configure" "debian/prerm remove" "debian/postrm remove"

all: test build

test:

	@echo -n "\n===== Comprobando posibles errores de sintaxis en los scripts de mantenedor =====\n\n"

	@for SCRIPT in $(SCRIPTS); \
	do \
		echo -n "$${SCRIPT}\n"; \
		bash -n $${SCRIPT}; \
	done

	@echo -n "\n=================================================================================\nHECHO!\n\n"

build:
	@echo "Nada para compilar!"

install:
	mkdir -p $(DESTDIR)/usr/share/canaima-webapps/
	mkdir -p $(DESTDIR)/usr/bin/
	mkdir -p $(DESTDIR)/usr/share/applications/

	cp -r scripts $(DESTDIR)/usr/share/canaima-webapps

	cp -r desktop/webapps-facebook.desktop $(DESTDIR)/usr/share/applications
	cp -r desktop/webapps-gmail.desktop $(DESTDIR)/usr/share/applications
	cp -r desktop/webapps-twitter.desktop $(DESTDIR)/usr/share/applications
	cp -r desktop/webapps-youtube.desktop $(DESTDIR)/usr/share/applications
	
	ln -s /usr/share/canaima-webapps/scripts/webapps-facebook.py $(DESTDIR)/usr/bin/webapps-facebook
	cp -r scripts/webapps-gmail $(DESTDIR)/usr/bin/
	ln -s /usr/share/canaima-webapps/scripts/webapps-twitter.py $(DESTDIR)/usr/bin/webapps-twitter
	ln -s /usr/share/canaima-webapps/scripts/webapps-youtube.py $(DESTDIR)/usr/bin/webapps-youtube
	
uninstall:
	rm -rf $(DESTDIR)/usr/share/canaima-webapps/
	rm -rf $(DESTDIR)/usr/share/applications/webapps-facebook.desktop
	rm -rf $(DESTDIR)/usr/share/applications/webapps-gmail.desktop
	rm -rf $(DESTDIR)/usr/share/applications/webapps-twitter.desktop
	rm -rf $(DESTDIR)/usr/share/applications/webapps-youtube.desktop
	rm -rf $(DESTDIR)/usr/bin/webapps-facebook
	rm -rf $(DESTDIR)/usr/bin/webapps-gmail
	rm -rf $(DESTDIR)/usr/bin/webapps-twitter
	rm -rf $(DESTDIR)/usr/bin/webapps-youtube

clean:

reinstall: uninstall install
