FROM alpine:3.24

LABEL com.github.containers.toolbox="true" \
      name="net-toolbox" \
      version="3.24" \
      usage="This image is meant to be used with the toolbox command" \
      summary="Alpine toolbox containers with network tools" \
      maintainer="Pedro Caetano <pedrompcaetano@gmail.com>"

# Install extra packages
COPY extra-packages /
RUN apk update && \
    apk upgrade && \
    cat /extra-packages | xargs apk add
RUN rm /extra-packages

# Clear out /media
RUN rm -fr /media
