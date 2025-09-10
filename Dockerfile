# Use a Node.js base image
FROM node:20-alpine
# Set the working directory
WORKDIR /app
# Add a cache buster argument
ARG CACHEBUSTER
# Copy dependency files first
COPY package.json ./
RUN npm install
# This step invalidates the cache to ensure new content is copied
RUN echo "Cache buster: $CACHEBUSTER"
# Copy all application files
COPY . .
# Expose the application port and define the start command
EXPOSE 3000
CMD ["node", "index.js"]
