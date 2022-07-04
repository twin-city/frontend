#######################
# Step 1: Base target #
#######################
FROM node:16.15.1-alpine as base
RUN   apk update \
 &&   apk add ca-certificates \
 &&   update-ca-certificates

WORKDIR /app
COPY . .
RUN npm config set strict-ssl false #Do not check certificate, proxy fault
RUN npm install

# Add Design de l'etat dans le static
RUN cp node_modules/@gouvfr/dsfr/dist static/dsfr -R

################################
# Step 2: "development" target #
################################
FROM base as dev
ARG FRONTEND_PORT

EXPOSE $FRONTEND_PORT

ENV PORT=$FRONTEND_PORT
ENV HOST=0.0.0.0

CMD [ "npm", "run","dev" ]

################################
# Step 3:   "build" target     #
################################
FROM base as build
CMD ["npm", "run", "build"]
