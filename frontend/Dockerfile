# Use Node 20 base image
FROM node:20

# Set working directory
WORKDIR /app

# Copy package files first (only package.json and package-lock.json)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all other files (app.js, etc.)
COPY . .

# Start the app
CMD ["node", "app.js"]
