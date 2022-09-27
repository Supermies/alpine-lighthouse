FROM node:14.20.1-alpine

RUN apk upgrade --no-cache --available \
    && apk add --no-cache \
      chromium bash \
  && rm -rf /var/cache/apk/* /tmp/*

RUN npm install -g lighthouse

# Disable Lighthouse error reporting to prevent prompt.
ENV CI=true

ENV CHROME_BIN=/usr/bin/chromium-browser \
    LIGHTHOUSE_CHROMIUM_PATH=/usr/bin/chromium-browser

CMD ["/bin/bash"]
