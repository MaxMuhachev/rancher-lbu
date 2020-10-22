FROM alpine

CMD ["python3", "-u", "run.py"]

WORKDIR /src

EXPOSE 80

RUN apk add --update python3
RUN apk add --no-cache --virtual .build-deps build-base python3-dev py3-pip \
    && pip3 --no-cache install aiohttp https://github.com/squeaky-pl/japronto/archive/master.zip \
	&& pip3 install -I --user idna \
	&& pip3 install -I --user chardet \
	&& apk del .build-deps \
	&& rm -rf /var/cache/apk/*

ADD *.py ./