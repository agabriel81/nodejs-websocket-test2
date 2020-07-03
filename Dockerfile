FROM nodejs

# Create app directory
WORKDIR "${APP_ROOT}"

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN bash -c "npm install websocket"
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
#COPY health ./health/
#COPY static ./static/
#COPY app.js ./
COPY app.js ./
COPY package.json ./

EXPOSE 8080
CMD [ "node", "app.js" ]
