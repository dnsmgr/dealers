FROM node

MAINTAINER Christian Aeschlimann

ENV SRC_ROOT /opt/src

# Where we will put everything
RUN mkdir ${SRC_ROOT}
WORKDIR ${SRC_ROOT}

ADD . ${SRC_ROOT}

RUN npm install
RUN npm install -g bower
RUN npm install grunt-cli -g

# since it references local dependencies (responsive framework libraries)
RUN bower install --quiet --allow-root --config.interactive=false

# 80 = HTTP, 443 = HTTPS, 3000 = MEAN.JS server, 35729 = livereload
EXPOSE 80 443 3000 35729 8080

CMD ["npm", "start"]
