FROM coding4m/proxywall
MAINTAINER coding4m@gmail.com


RUN apt-get update && apt-get install -y --no-install-recommends nginx \
	&& rm -rf /var/lib/apt/lists/*

RUN /etc/init.d/nginx start
ENTRYPOINT ["/usr/local/bin/proxywall-daemon"]