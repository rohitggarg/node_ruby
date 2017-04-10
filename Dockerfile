FROM centos:7
ENV NODE_VERSION 0.12.18
ENV RUBY_VERSION 2.4.1
RUN yum -y update; yum clean all
RUN yum install -y git gcc make openssl-devel readline-devel wget bzip2; yum clean all
RUN wget http://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-$(uname -m | sed 's/86_//').tar.gz
RUN tar --strip-components 1 -xzvf node-v* -C /usr/local
RUN git clone https://github.com/tagomoris/xbuild.git /usr/local/xbuild
RUN /usr/local/xbuild/ruby-install ${RUBY_VERSION} /usr/local/ruby-${RUBY_VERSION}; rm -rf /var/tmp/ruby-build*

ENV PATH /usr/local/ruby-${RUBY_VERSION}/bin:$PATH
RUN gem install bundler --no-document
