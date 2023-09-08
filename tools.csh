alias mydu 'du -s * .[^.]* | sort -n | awk '\''{print $NF}'\'' | tr '\n' '\0' | xargs -0 -n 1 du -sh '

alias sortu 'awk '\''\\!line[$0]++'\'''
