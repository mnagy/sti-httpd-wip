for i in /opt/openshift/scl_enable.d/*.sh ; do
  if [ -r "$i" ]; then
    . "$i"
  fi
done
