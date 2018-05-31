encrypt () {
	openssl aes-256-cbc -a -salt -in "${1}" -out "${1}.openssl" && rm "${1}"
}

decrypt () {
	openssl aes-256-cbc -d -a -in "${1}" -out "${1%.openssl}"
}

alias ..='cd ..'
alias ...='cd ..; cd ..'
alias yis='yarn install && yarn start'
