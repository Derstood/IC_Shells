alias mydu 'du -s ./* | sort -n | awk '\''{print $NF}'\'' | xargs du -sh '

alias sortu 'awk '\''\\!line[$0]++'\'''
