FROM frolvlad/alpine-glibc

WORKDIR /factorio

RUN apk add --update curl tar xz && \
    rm -rf /var/cache/apk/* && \
    curl -sL https://www.factorio.com/get-download/0.16.51/headless/linux64 | tar --strip-components=1 -xJf - && \
    apk del curl tar xz && \
    rm data/*.json && rm data/*.txt

VOLUME ["/factorio/saves"]
VOLUME ["/factorio/config"]
VOLUME ["/factorio/mods"]

EXPOSE 34197/udp

ENV SAVE_FILE /factorio/saves/save.zip
ENV CONFIG_FILE /factorio/config/server-settings.json

COPY start start


ENTRYPOINT ["./start"]
