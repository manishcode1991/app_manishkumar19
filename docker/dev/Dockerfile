from registry.gitlab.com/manishkumar19/poc/base:latest

MAINTAINER Nagarro<manish.kumar19@nagarro.com>

RUN set -eux; \
	apt-get --allow-releaseinfo-change update; \
	apt-get install -y gosu; \
	rm -rf /var/lib/apt/lists/*; \
    # verify that the binary works
	gosu nobody true

# add user and group

RUN groupadd --gid 1000 app && \
    useradd --gid 1000 --uid 1000 --no-create-home app


RUN . /appenv/bin/activate && \
	pip install wheel


ENV WHEELHOUSE=/wheelhouse PIP_WHEEL_DIR=/wheelhouse PIP_FIND_LINKS=/wheelhouse XDG_CACHE_HOME=/cache


VOLUME /wheelhouse

WORKDIR /application

COPY src /application/

COPY docker/dev/development.sh /usr/local/bin/development.sh

COPY requirements.txt requirements.txt

RUN chmod +x /usr/local/bin/development.sh

RUN development.sh

#ENTRYPOINT ["development.sh"]

CMD ["python","manage.py", "runserver"]

