FROM nginx:alpine

# /cstate will be our volume & building directory
WORKDIR /cstatus

# Install hugo & git
RUN apk add --no-cache hugo git

# -- First Run --

# Download the example site
RUN git clone https://github.com/invisionmediagroups/cstatus-example /cstatus

# Copy files from this repo into themes/cstatus
RUN mkdir -p /cstatus/themes/cstatus
COPY . /cstatus/themes/cstatus

# Prepare the entrypoint files
COPY ./docker/entrypoint.sh /docker-entrypoint.d/10-build-hugo.sh
