# ~/.bash_aliases

# Kill all running containers.
alias dockerkillall='docker kill $(docker ps -q)'

# Delete all stopped containers.
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'

# Delete all untagged images.
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'

# Delete all stopped containers and untagged images.
alias dockerclean='dockercleanc || true && dockercleani'

# Docker app shortcuts
liteadmin () {
	echo "phpLiteAdmin url: http://0.0.0.0:2015/phpliteadmin.php"
	docker run -it --rm -p 2015:2015 -v "`pwd`/${1}":/db acttaiwan/phpliteadmin
}

alias yt='docker run --rm -u $(id -u):$(id -g) -v "$PWD":/data vimagick/youtube-dl -f "best[ext=mp4][height<=720]/best"'
alias travis='docker run --rm tianon/travis-cli travis'
