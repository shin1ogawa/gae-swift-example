FROM ubuntu:15.10

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install curl clang libicu-dev make libxml2
RUN apt-get -y install tree git vim

WORKDIR /tmp

# Install Swift
ENV SWIFT_PACKAGE swift-2.2-SNAPSHOT-2015-12-31-a-ubuntu15.10.tar.gz
RUN curl https://swift.org/builds/ubuntu1510/swift-2.2-SNAPSHOT-2015-12-31-a/swift-2.2-SNAPSHOT-2015-12-31-a-ubuntu15.10.tar.gz -o $SWIFT_PACKAGE.tar.gz
RUN tar zxf $SWIFT_PACKAGE.tar.gz --directory / --strip-components=1
RUN rm -f $SWIFT_PACKAGE.tar.gz

# Install https://github.com/huytd/swift-http.git
RUN git clone https://github.com/huytd/swift-http.git && cd swift-http && swift build

RUN apt-get clean

EXPOSE 8080

WORKDIR /tmp/swift-http

CMD .build/debug/example
