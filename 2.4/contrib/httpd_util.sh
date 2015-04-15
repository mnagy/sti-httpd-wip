# source

export HTTPD_SERVER_ADMIN=${HTTPD_SERVER_ADMIN:-default@localhost}

function configure_httpd() {
  echo "---> Configuring Apache"
  for template in $(find /opt/openshift/httpd/ -name '*.template'); do
    envsubst < ${template} > ${template%.template}
  done
}

function exec_httpd() {
  exec httpd -DFOREGROUND -d /opt/openshift/httpd/ "$@"
}
