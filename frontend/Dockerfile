#######################
# Step 1: Base target #
#######################
FROM node:16.15.1-alpine as base
#RUN   apk update \
# &&   apk add ca-certificates \
# &&   update-ca-certificates

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
#RUN npm config set strict-ssl false #Do not check certificate, proxy fault

# Add Design de l'etat dans le static
RUN  mkdir -p static/dsfr \
 &&  cp node_modules/@gouvfr/dsfr/dist/dsfr.module.min.js static/dsfr \
 &&  cp node_modules/@gouvfr/dsfr/dist/dsfr.nomodule.min.js static/dsfr \
 &&  cp node_modules/@gouvfr/dsfr/dist/dsfr.min.css static/dsfr \
 &&  cp -r node_modules/@gouvfr/dsfr/dist/utility static/dsfr \
 &&  cp -r node_modules/@gouvfr/dsfr/dist/favicon static/dsfr  \
 &&  cp -r node_modules/@gouvfr/dsfr/dist/icons static/dsfr


################################
# Step 2: "development" target #
################################
FROM base as dev
ARG FRONTEND_PORT
EXPOSE $FRONTEND_PORT
EXPOSE 24678

ENV PORT=$FRONTEND_PORT
ENV HOST=0.0.0.0

CMD [ "npm", "run","dev" ]

################################
# Step 3:   "build" target     #
################################
FROM base as build

CMD ["npm", "run", "build"]
