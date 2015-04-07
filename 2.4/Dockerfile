FROM centos:centos7
MAINTAINER  Martin Nagy <mnagy@redhat.com>

# Httpd image for OpenShift.
# Volumes:
#  * /var/www/html - root for html documents
# Environment:
#  None

# Image metadata
ENV HTTPD_VERSION           2.4
ENV IMAGE_DESCRIPTION       Apache httpd server, version 2.4
ENV IMAGE_TAGS              httpd,httpd24
ENV IMAGE_EXPOSE_SERVICES   8080:http

EXPOSE 8080

# This image must forever use UID 48 for apache user so our volumes are
# safe in the future. This should *never* change, the last test is there
# to make sure of that.
RUN rpmkeys --import file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 && \
    yum -y --setopt=tsflags=nodocs install https://www.softwarecollections.org/en/scls/rhscl/httpd24/epel-7-x86_64/download/rhscl-httpd24-epel-7-x86_64.noarch.rpm && \
    yum -y --setopt=tsflags=nodocs install httpd24 && \
    yum clean all && \
    mkdir -p /var/www/html && chown apache.apache /var/www/html && \
    test "$(id apache)" = "uid=48(apache) gid=48(apache) groups=48(apache)"

COPY run-httpd.sh /usr/local/bin/
COPY contrib/httpd /opt/openshift/httpd
COPY contrib/httpd24-enable.sh /etc/profile.d/

VOLUME ["/var/www/html"]

# TODO: Uncomment later
#USER apache

#ENTRYPOINT ["run-httpd.sh"]
#CMD ["httpd"]
