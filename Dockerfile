FROM centos:7
RUN yum -y update; yum clean all
RUN yum install -y git gcc make openssl-devel readline-devel wget bzip2; yum clean all
RUN wget http://nodejs.org/dist/v0.12.9/node-v0.12.9-linux-$(uname -m | sed 's/86_//').tar.gz
RUN tar --strip-components 1 -xzvf node-v* -C /usr/local
RUN git clone https://github.com/tagomoris/xbuild.git /usr/local/xbuild
RUN /usr/local/xbuild/ruby-install 2.2.3 /usr/local/ruby-2.2.3; rm -rf /var/tmp/ruby-build*

ENV PATH /usr/local/ruby-2.2.3/bin:$PATH
RUN gem install bundler --no-document
