FROM hugomods/hugo:0.117.0 AS builder

WORKDIR /app

ADD . hugo
RUN cd /app/hugo && hugo mod get -u github.com/colinwilson/lotusdocs && hugo -v --minify

FROM fholzer/nginx-brotli:latest

# LABEL org.opencontainers.image.source https://github.com/labring/LazyGPT

COPY --from=builder /app/hugo/public /usr/share/nginx/html