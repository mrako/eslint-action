FROM node:10.14.1-alpine

COPY .eslintrc.template.json /.eslintrc.json
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
