I switched to ZSH, so there is no bashrc anymore. Might still be usefull to some folks.

added functions:

	extract
		extracts :
			.tar.bz2
			.tar.gz
			.bz2
			.rar
			.gz
			.tar
			.tbz2
			.tgz
			.zip
			.Z
			.7z

	maketar
		Creates an archive (.tar.gz) from given directory.
	makezip
		Create a ZIP archive of a file or folder.
	my_ip
		Prints the hosts ipv4 and ipv6 adress
	mydf
		Pretty-print of 'df' output. Inspired by 'dfc' utility.
	ii
		Prints information of the host system
	ff
		improved fuzzy find
	revent
		git hard reset to a given commit
	commit
		git commit -m
	add
		git add on all files in the directory
	docker_stop
		stops ALL running container instances
	docker_remove
		removes ALL not running containers
	docker_rmi
		removes all unused images
	svn_fame
		like git fame just for svn
	flash_avr
		uses [c45b](https://github.com/bullestock/c45b) to flash a hex files
	big_files
		prints the 10 biggest files recursively in a directory
	replace_spaces
		replaces spaces in filenames with a -
	lookup
		dig + short
	create_play
		wrapper for ansible-galaxy init
	webserver
		starts a python webserver to server the current cirectory
	sonar_settings
		fullfills the requirements of sonarqube for local testing


added alias:

	alias ls='exa'
	alias la='exa -alh --group-directories-first'
	alias lh='exa -d .* --color=auto'
	alias pacman='sudo pacman'
	alias fucking='sudo'
	alias reboot='sudo reboot'
	alias bc='bc -l'
	alias grep='grep --color=auto'
	alias cpuinfo='lscpu'
	alias push='git push'
	alias pull='git pull'
	alias gca='clustergit -p'
	alias update='yaourt -Syua --noconfirm'
	alias emacs='emacs -nw'
	alias weather='curl wttr.in/Bochum'
	alias grv='TERM=xterm grv'
	alias ip='ip -c -br add'
	alias less='bat'
	alias pub_ip='dig @resolver1.opendns.com A myip.opendns.com +short -4'
	alias backup='sudo systemctl start restic-backup && sudo journalctl -fu restic-backup'
	alias k='kubectl'
	alias ka='kubectl get all'

Supports
* https://github.com/gnunn1/tilix
* https://github.com/zyedidia/micro
* https://github.com/pyenv/pyenv

Depends on
* https://github.com/dylanaraps/neofetch
* https://github.com/ogham/exa
