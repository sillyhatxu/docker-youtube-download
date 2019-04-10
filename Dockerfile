FROM python:2.7.16-alpine3.9
LABEL MAINTAINER="heixiushamao@gmail.com"

ENV TIME_ZONE=Asia/Singapore

RUN ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone
RUN apk add --no-cache tzdata
RUN apk --update --no-cache add curl
RUN apk add --no-cache ca-certificates

RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod a+rx /usr/local/bin/youtube-dl

WORKDIR /app

ENTRYPOINT ["sh", "/app/download.sh"]


