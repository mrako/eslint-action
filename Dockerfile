FROM node:10.14.1-alpine

COPY eslintrc.template /.eslintrc
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
