FROM centos:latest

MAINTAINER Filipe Bojikian Rissi <filiperissi@finchsolucoes.com.br>

ARG gp=8080

ENV JAVA_VERSION_MAJOR=8 \
    JAVA_VERSION_MINOR=161 \
    JAVA_VERSION_BUILD=12 \
    JAVA_PACKAGE=jdk \
    JAVA_HASH=2f38c3b165be4555a1fa6e98c45e0808 \
    JAVA_HOME=/opt/java \
    PATH=${PATH}:/opt/java/bin \
    JAVA_OPTS="" \
    LANG=en_US.UTF-8

# Instalar Java

RUN yum update -y \
    && yum install -y which zip unzip \
    && curl -jkSLH "Cookie: oraclelicense=accept-securebackup-cookie" -o /tmp/java.tar.gz \
        http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_HASH}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz \
    && tar -C /opt -zxf /tmp/java.tar.gz \
    && ln -s /opt/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} ${JAVA_HOME} \
    && curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" -o /tmp/unlimited_jce_policy.zip "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" \
    && unzip -jo -d ${JAVA_HOME}/jre/lib/security /tmp/unlimited_jce_policy.zip \
    && rm -rf ${JAVA_HOME}/*src.zip \
        ${JAVA_HOME}/lib/missioncontrol \
        ${JAVA_HOME}/lib/visualvm \
        ${JAVA_HOME}/lib/*javafx* \
        ${JAVA_HOME}/jre/plugin \
        ${JAVA_HOME}/jre/bin/javaws \
        ${JAVA_HOME}/jre/bin/jjs \
        ${JAVA_HOME}/jre/bin/keytool \
        ${JAVA_HOME}/jre/bin/orbd \
        ${JAVA_HOME}/jre/bin/pack200 \
        ${JAVA_HOME}/jre/bin/policytool \
        ${JAVA_HOME}/jre/bin/rmid \
        ${JAVA_HOME}/jre/bin/rmiregistry \
        ${JAVA_HOME}/jre/bin/servertool \
        ${JAVA_HOME}/jre/bin/tnameserv \
        ${JAVA_HOME}/jre/bin/unpack200 \
        ${JAVA_HOME}/jre/lib/javaws.jar \
        ${JAVA_HOME}/jre/lib/deploy* \
        ${JAVA_HOME}/jre/lib/desktop \
        ${JAVA_HOME}/jre/lib/*javafx* \
        ${JAVA_HOME}/jre/lib/*jfx* \
        ${JAVA_HOME}/jre/lib/amd64/libdecora_sse.so \
        ${JAVA_HOME}/jre/lib/amd64/libprism_*.so \
        ${JAVA_HOME}/jre/lib/amd64/libfxplugins.so \
        ${JAVA_HOME}/jre/lib/amd64/libglass.so \
        ${JAVA_HOME}/jre/lib/amd64/libgstreamer-lite.so \
        ${JAVA_HOME}/jre/lib/amd64/libjavafx*.so \
        ${JAVA_HOME}/jre/lib/amd64/libjfx*.so \
        ${JAVA_HOME}/jre/lib/ext/jfxrt.jar \
        ${JAVA_HOME}/jre/lib/ext/nashorn.jar \
        ${JAVA_HOME}/jre/lib/oblique-fonts \
        ${JAVA_HOME}/jre/lib/plugin.jar \
        /tmp/* /var/cache/apk/*

RUN yum remove -y zip unzip \
    && yum autoremove -y \
    && yum clean all \
    && rm -rf /tmp/* /var/tmp/*

COPY entrypoint.sh /usr/bin/entrypoint
COPY start.vmoptions .

RUN chmod +x /usr/bin/entrypoint

EXPOSE $gp

ENTRYPOINT ["entrypoint"]
CMD ["--server.port=$gp"]
