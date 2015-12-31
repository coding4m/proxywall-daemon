FROM coding4m/proxywall
MAINTAINER coding4m@gmail.com

RUN apt-get update && apt-get install -y --no-install-recommends nginx \
	&& rm -rf /var/lib/apt/lists/*

ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./nginx.tmpl /etc/nginx/nginx.tmpl

ENV PROXYWALL_TEMPLATE_SRC /etc/nginx/nginx.tmpl
ENV PROXYWALL_TEMPLATE_DEST /etc/nginx/conf.d/default.conf
ENV PROXYWALL_POST_CMD "/etc/init.d/nginx restart"

EXPOSE 80 443
ENTRYPOINT ["/usr/local/bin/proxywall-daemon"]