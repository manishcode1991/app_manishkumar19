from registry.gitlab.com/manishkumar19/poc/dev:latest

MAINTAINER Nagarro <manish.kumar19@nagarro.com>

EXPOSE 8005 8001

RUN . /appenv/bin/activate

#ENTRYPOINT ["uwsgi"]

CMD ["uwsgi --http-socket", "0.0.0.0:8005", \
     "--chdir", "/application", \
     "--module", "poc.wsgi", \
     "--home", "/appenv", \
     "--master", "--processes", "4", "--threads", "2", \
     "--max-requests", "5000", \
     "--harakiri", "20", \
     "--vacuum", \
     "--stats", "0.0.0.0:8001"]