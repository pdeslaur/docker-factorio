FROM frolvlad/alpine-glibc

MAINTAINER Philippe Deslauriers <philipe@deslauriers.me>

WORKDIR /factorio

RUN apk add --update curl tar xz && \
    rm -rf /var/cache/apk/* && \
    curl -L https://www.factorio.com/get-download/0.16.51/headless/linux64 | tar --strip-components=1 -xJf - && \
    apk del curl tar xz && \
    rm data/*.json && rm data/*.txt

VOLUME ["/factorio/saves"]
VOLUME ["/factorio/mods"]

EXPOSE 34197/udp

ENV FACTORIO_SAVE_NAME save

COPY start start

ENTRYPOINT ["./start"]
