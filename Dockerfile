# Defines the base Docker image. This one is a pre-built image that includes Nodejs from https://hub.docker.com/_/node and uses Alpine Linux as its base.
# Alpine Linux is a version of Linux that includes the minimum dependencies necessary, which helps with keeping the Docker
# images sizes as small as possible.
FROM node:18-alpine

# Defines the base directory where docker will run the next instructions
WORKDIR /build

# Copies the local index.js file to the container /build directory
COPY index.js ./

# Crates the user that will run the application
RUN addgroup -S app && adduser -S -G app app

# Defines the user that will run the next commands
USER app

# Exposes the port that the application will run so it is reachable from outside the container
EXPOSE 3000

# The default command that the container will run when executed, in this case it starts the nodejs application
CMD ["node", "index.js"]
