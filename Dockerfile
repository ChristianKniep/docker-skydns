###### Helixdns images
# A docker image that includes
# - etcd
# - helixdns
FROM qnib/etcd
MAINTAINER "Christian Kniep <christian@qnib.org>"

EXPOSE 53

### HELIXDNS INST BELOW
RUN echo "20140816.1"; yum clean all; yum install -y qnib-skydns

ADD etc/supervisord.d/skydns.ini /etc/supervisord.d/
ADD root/bin/start_skydns.sh /root/bin/start_skydns.sh

CMD /bin/supervisord -c /etc/supervisord.conf
