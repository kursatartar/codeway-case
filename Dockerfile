# Base image for the application (Node.js version 16)
FROM node:16

# Setting the working directory to /app
WORKDIR /app

# Copying dependency files for package management
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copying the source code into the container
COPY . .

# Exposing the port the application will run on
EXPOSE 8080

# Starting the application
CMD ["npm", "start"]
