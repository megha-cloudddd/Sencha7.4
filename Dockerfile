FROM openjdk:8-jre

RUN apt-get update -y

WORKDIR /tmp

RUN wget http://cdn.sencha.com/cmd/7.4.0.39/no-jre/SenchaCmd-7.4.0.39-linux-amd64.sh.zip

RUN unzip SenchaCmd-7.4.0.39-linux-amd64.sh.zip

#COPY conf/senchacmd.varfile /tmp/senchacmd.varfile

RUN /tmp/`find SenchaCmd*.sh` -q -dir "/opt/sencha/7.4" -Dall=true

RUN ln -s /opt/sencha/7.4/sencha /usr/local/bin/sencha

COPY src /opt/demo

WORKDIR /opt/demo

RUN sencha app build

#RUN cp -r build/production/demo/* /usr/share/nginx/html
