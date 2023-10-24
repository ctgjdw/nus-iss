FROM node:18

WORKDIR /app

COPY . .
RUN npm ci

ENV PORT=3001
ENV INSTANCE_NAME="dov"
ENV INSTANCE_HASH="1234"

EXPOSE ${PORT}

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl -s -f http://localhost:${PORT}/healthz > /dev/null || exit 1

ENTRYPOINT [ "node", "main.js" ]