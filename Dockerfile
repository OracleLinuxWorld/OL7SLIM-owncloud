# "ported" by Johan Louwers <louwersj@gmail.com> from
# https://github.com/fedora-cloud/Fedora-Dockerfiles

FROM oraclelinux:7-slim
LABEL maintainer="Johan Louwers <louwersj@gmail.com>"

# Perform updates
RUN yum -y update; yum clean all

# Install EPEL for owncloud packages
RUN rpm -ivh https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm

# Install owncloud owncloud-httpd owncloud-sqlite rpms
RUN yum install -y owncloud{,-httpd,-sqlite}; yum clean all

# Install SSL module and force SSL to be used by owncloud
RUN yum install -y mod_ssl; yum clean all
#RUN sed -i 's/"forcessl" => false,/"forcessl" => true,/' /etc/owncloud/config.php

# Allow connections from everywhere
RUN sed -i 's/Require local/Require all granted/' /etc/httpd/conf.d/owncloud.conf
RUN sed -i "s/'trusted_domains'/#'trusted_domains'/" /etc/owncloud/config.php

# Expose port 443 and set httpd as our entrypoint
EXPOSE 443 80
ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]
