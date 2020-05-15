FROM node:alpine

COPY .eslintrc.template.json /.eslintrc.json
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
