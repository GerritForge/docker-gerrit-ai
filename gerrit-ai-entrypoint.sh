#/bin/bash -e

setConfig() {
  git config -f /var/gerrit/etc/gerrit.config $1 $2
}

setConfig httpd.firstTimeRedirectUrl /login/%23%2Fstatic%2Fintro.html?account_id=1000000

exec /entrypoint.sh