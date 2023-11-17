FROM node:16-alpine as builder
LABEL maintainer="Hoyeong Jo"
LABEL description=""

USER root
WORKDIR /home/node

COPY package*.json ./
COPY yarn.lock ./
COPY tsconfig.json ./
COPY tsconfig.build.json ./

RUN apk -U upgrade \
  && apk add --no-cache \
    git \
    openssh

RUN npm install

COPY --chown=node:node . .
RUN npm build
RUN rm -rf src
# ---

# alpine 은 기본적으로 timezone 설정이 되지 않음[]
RUN apk --no-cache add tzdata && \
	cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
	echo "Asia/Seoul" > /etc/timezone \
	apk del tzdata

ENV PORT 5500

EXPOSE 5500
CMD ["yarn", "start"]