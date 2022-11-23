ARG TARGETARCH

FROM caddy:2-builder AS builder

RUN GOARCH=$TARGETARCH xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
