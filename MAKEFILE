HOME_DIR=$(HOME)

help:
	@echo "bashrc" makefile
	@echo
	@echo Options available:
	@echo  "  % make 		display this help"
	@echo
	@echo  "  % make backup		take a backup of the original .bashrc"
	@echo  "                        (it is saved as .bashrc.ORIGINAL)"
	@echo  "                        you should run this once in the begining"
	@echo  "                        otherwise you may overwrite the backup"
	@echo
	@echo  "  % make install	install the new .bashrc* files in"
	@echo  "                        the current directory"
	@echo
	@echo "The author does not take any responsibility" 
	@echo "for the bad use/misuse of this Makefile."
	@echo

backup:
	@test -f $(HOME)/.bashrc.ORIGINAL && echo "Backup already exists!" || echo -n ""
	@test ! -f $(HOME)/.bashrc || cp $(HOME)/.bashrc $(HOME)/.bashrc.ORIGINAL

install:
	@echo "Copying config files to $(HOME)..."
	@/bin/mkdir $(HOME_DIR)/.shells
	@/bin/cp -f .bashrc          	$(HOME_DIR)/.bashrc
	@/bin/cp -f .shells/exports    	$(HOME_DIR)/.shells/exports
	@/bin/cp -f .shells/alias  		$(HOME_DIR)/.shells/alias
	@/bin/cp -f .shells/functions 	$(HOME_DIR)/.shells/functions
	@echo "Copying done."
sex: 
	@echo "Sorry, it's 'have sex', not 'make sex'."

love:
	@echo "make: *** No rule on how to make \`love'.  Stop."

war:
	@echo "make: *** No idea how to make war. War is stupid.  Stop."