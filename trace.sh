#tail -f /var/log/apache2/error.log | grep -e UID -e PIN >> /scripts/output.txt
tail -f /var/log/apache2/error.log | grep --line-buffered -e UID -e PIN | sed 's/^.*://' 

#| tee /scripts/output.log

