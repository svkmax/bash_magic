encrypt () {
	openssl aes-256-cbc -a -salt -in "${1}" -out "${1}.openssl" && rm "${1}"
}

decrypt () {
	openssl aes-256-cbc -d -a -in "${1}" -out "${1%.openssl}"
}

paste () {
	read -d '' IN
	curl --silent -H "Content-Type: application/text" -X POST -d "$IN" https://hastebin.com/documents \
		| sed 's/^{\"key\":\"\(.*\)\"}$/https\:\/\/hastebin.com\/raw\/\1/'
	echo
}

alias ..='cd ..'
alias ...='cd ..; cd ..'
alias yis='yarn install && yarn start'
