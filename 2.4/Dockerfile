FROM openshift/base-centos7
MAINTAINER  Martin Nagy <mnagy@redhat.com>

# Apache httpd image for OpenShift.
# Environment:
#  HTTPD_SERVER_ADMIN (Optional) - Admin email address

# Image metadata
ENV HTTPD_VERSION           2.4
ENV IMAGE_DESCRIPTION       Apache httpd server, version 2.4
ENV IMAGE_TAGS              httpd,httpd24
ENV IMAGE_EXPOSE_SERVICES   8080:http

EXPOSE 8080

RUN rpmkeys --import file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 && \
    yum -y --setopt=tsflags=nodocs install https://www.softwarecollections.org/en/scls/rhscl/httpd24/epel-7-x86_64/download/rhscl-httpd24-epel-7-x86_64.noarch.rpm && \
    yum -y --setopt=tsflags=nodocs install httpd24 && \
    yum clean all && \
    mkdir -p /opt/openshift/www/html && \
    chown -R default.default /opt/openshift/www /var/log/httpd24 /opt/rh/httpd24/root/var/run/httpd

USER default
