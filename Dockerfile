FROM node:18-alpine

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Expose the default React Native port
EXPOSE 8081

# Start the React Native application
CMD ["npm", "start"] 