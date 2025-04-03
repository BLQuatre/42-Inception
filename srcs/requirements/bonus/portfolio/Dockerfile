FROM alpine:3.21.2

WORKDIR /app

RUN apk update --no-cache \
&& apk add --no-cache nodejs npm git \
&& git clone https://github.com/BLQuatre/portfolio.git . \
&& cp example.env.d.ts env.d.ts \
&& npm install \
&& npm run build \
&& npm install -g serve

CMD ["serve", "-s", "dist", "-l", "80"]
