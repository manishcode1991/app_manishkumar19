FROM python:3.8.2

MAINTAINER Nagarro<manish.kumar19@nagarro.com>

RUN apt-get update -y && \
    apt-get dist-upgrade -y && \
    apt-get install -y libmariadbclient-dev && \
    apt-get install -y gdal-bin && \
    apt-get install -y python3-dev

RUN apt-get update && apt-get install -y \
  binutils \
  gdal-bin \
  python3-gdal \
  libproj-dev

RUN python3 -m venv /appenv && \
	. /appenv/bin/activate && \
	pip install pip --upgrade


# Add entrypoint script
ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
