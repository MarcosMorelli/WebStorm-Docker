FROM ubuntu:18.04

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

WORKDIR /home/me
ENV HOME /home/me

ADD https://download.jetbrains.com/webstorm/WebStorm-2019.3.3.tar.gz?_ga=2.123651790.490059063.1583327819-1608010033.1555003968 .
RUN tar -xzf WebStorm-2019.3.3.tar.gz
RUN rm WebStorm-2019.3.3.tar.gz
ENTRYPOINT [ "/home/me/WebStorm-193.6494.34/bin/webstorm.sh" ]
