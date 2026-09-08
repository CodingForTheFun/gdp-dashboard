FROM mcr.microsoft.com/playwright:v1.63.0-noble
WORKDIR /app
COPY chunks /tmp/chunks
RUN cat /tmp/chunks/chunk* | base64 -d > /tmp/app.tar.gz \
 && tar -xzf /tmp/app.tar.gz -C /app \
 && rm -rf /tmp/chunks /tmp/app.tar.gz \
 && npm install --omit=dev
ENV NODE_ENV=production PORT=3000
EXPOSE 3000
CMD ["node","server.mjs"]
