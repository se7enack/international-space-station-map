FROM ubuntu:latest

RUN export DEBIAN_FRONTEND="noninteractive"


RUN apt update && apt install -y --fix-missing \
    tzdata \
    ssh \
    jq \
    curl \
    wget \
    imagemagick


# Set the working directory.
WORKDIR /usr/src/app

# Copy the file from your host to your current location.
COPY iss* /usr/src/app/

# Run the command inside your image filesystem.
RUN /usr/src/app/iss.sh 

ENTRYPOINT  /usr/src/app/iss.sh
