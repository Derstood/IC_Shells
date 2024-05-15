alias mydu 'du -s * .[^.]* | sort -n | awk '\''{print $NF}'\'' | tr '\n' '\0' | xargs -0 -n 1 du -sh '

## 仅去重，不影响原有顺序
alias sortu 'awk '\''\\!line[$0]++'\'''
