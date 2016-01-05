###### Helixdns images
# A docker image that includes
# - etcd
# - helixdns
FROM qnib/etcd

EXPOSE 53

ENV GOPATH=/usr/local/
RUN yum install -y golang git-core && \
    go get github.com/skynetservices/skydns && \
    cd $GOPATH/src/github.com/skynetservices/skydns && \
    go build -v && \
    yum remove -y golang git-core 

ADD etc/supervisord.d/skydns.ini /etc/supervisord.d/
ADD opt/qnib/skydns/bin/start.sh /opt/qnib/skydns/bin/start.sh

