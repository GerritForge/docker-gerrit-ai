#/bin/bash -e

setConfig() {
  git config -f /var/gerrit/etc/gerrit.config $1 $2
}

setConfig httpd.firstTimeRedirectUrl /login/%23%2Fstatic%2Fintro.html?account_id=1000000
setConfig gerrit.serverId 4ca5675a-8812-4c33-b94f-ce3de104a853

exec /entrypoint.sh
