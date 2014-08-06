FROM meandmymonkey/php5

MAINTAINER Andreas Hucks "andreas@inputrequired.org"

RUN apt-get -y install git-core

RUN \
    composer create-project \
    composer/satis /opt/satis --stability=dev --keep-vcs

RUN \
    mkdir -p /opt/bin && \
    echo "#!/bin/bash" >> /opt/bin/satis-build && \
    echo "exec /usr/bin/php /opt/satis/bin/satis build /etc/satis.json /var/www" \
    >> /opt/bin/satis-build && \
    chmod 777 /opt/bin/satis-build && \
    rm /var/www/index.php && \
    echo "no data available" > /var/www/index.html

ADD ./default /etc/nginx/sites-available/default

CMD ["nginx"]