FROM node:16.11
ENV NODE_ENV=production
COPY dist /node
COPY test /node/test
COPY package.json package-lock.json /node/
WORKDIR /node
RUN npm install -g mocha \
    npm install
CMD ["node", "app.js"]