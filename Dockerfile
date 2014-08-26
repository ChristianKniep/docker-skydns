###### Helixdns images
# A docker image that includes
# - etcd
# - helixdns
FROM qnib/etcd
MAINTAINER "Christian Kniep <christian@qnib.org>"

EXPOSE 53
EXPOSE 4001
EXPOSE 7001

### HELIXDNS INST BELOW
RUN echo "20140816.1"; yum clean all; yum install -y qnib-skydns

CMD /bin/supervisord -c /etc/supervisord.conf
