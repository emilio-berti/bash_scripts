# Aliases
alias server_connect="ssh eb97ziwi@rstudio1.idiv.de"
alias server_clean="ssh eb97ziwi@rstudio1.idiv.de 'rm -r ~/.rstudio/sessions/'"
alias server_kill="ssh eb97ziwi@rstudio1.idiv.de 'kill-my-rstudio-session'"
server_to_here() {
  scp eb97ziwi@rstudio1.idiv.de:/homes/eb97ziwi/$1 $2
}
server_from_here() {
  scp $1 eb97ziwi@rstudio1.idiv.de:/homes/eb97ziwi/$2
}
server_from_here_dir() {
	for f in *
	do
 		scp $1 eb97ziwi@rstudio1.idiv.de:/homes/eb97ziwi/$2
	done	
}
lowercase() {
	echo $1 | tr  '[:upper:]' '[:lower:]'
	echo $1 | tr  '[:upper:]' '[:lower:]' | xclip -sel clip
}
uppercase() {
	echo $1 | tr  '[:lower:]' '[:upper:]'
	echo $1 | tr  '[:lower:]' '[:upper:]' | xclip -sel clip
}

# cat all files with pattern
cat_files_with_pattern() {
	find . -maxdepth 1  -name "$1" -print0 | xargs -0 cat
}

alias count_elephants="ls | sed 's/\_.*//' | uniq"

count_el_files() {
    names=$(ls -1 "/media/eb97ziwi/emilio-idiv/samburu" | cut -d '_' -f 1 | sort | uniq)
    for el in $names
    do
        len=$(ls -1 "/media/eb97ziwi/emilio-idiv/samburu" | grep $el | wc -l)
        factors=$(factor $(($len - 1)))
        echo $el $factors
    done
}

raspip() {
  self=$(ip addr | grep 'inet 192' | head -n 1 | tr -s ' ' | cut -d ' ' -f 3)
  rasp=$(nmap -sn $self | grep raspberry)
  rasp_ip=$(echo $rasp | cut -d '(' -f 2 | tr -d ')')
  echo $rasp_ip
}
alias public-ip="curl -s https://checkip.amazonaws.com"
