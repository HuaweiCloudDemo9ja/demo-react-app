# Step 1: Build the React app
FROM node:18-alpine AS build

# Set working directory
WORKDIR /app

# Accept build-time arguments
ARG REACT_APP_APP_NAME

# Make them available inside the container during build
ENV REACT_APP_APP_NAME=$REACT_APP_APP_NAME

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app and build
COPY . .

# Build the React app (environment variables are baked in here)
RUN npm run build

# Step 2: Serve the app with Nginx
FROM nginx:alpine

# Copy build output to Nginx's default html directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
