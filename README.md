Just a little improvement to the default bashrc

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
		improved find on home folder
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


added alias:

	alias ls='exa'
	alias la='exa -alh --sort=created --group-directories-first'
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

Supports
* https://github.com/nvbn/thefuck
* https://github.com/gnunn1/tilix
* https://github.com/zyedidia/micro

Depends on
* https://github.com/trapd00r/screenfo
* https://github.com/ogham/exa
