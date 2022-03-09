FROM node:alpine
ENV PNPM_STORE /var/cache/pnpm-store
ENV HOME /usr/src/app
ENV OUT build
ENV REPO user/repo
ENV INSTALL true
ENV SERVE false
RUN npm i -g pnpm
WORKDIR $HOME
EXPOSE 3000
ENTRYPOINT ["/bin/sh", "-c", "pnpm config set store-dir $PNPM_STORE && if [ $REPO != 'user/repo' ] && [ ! -f package.json ] ; then pnpx --yes degit --force $REPO; fi && if [ $INSTALL = true ] ; then pnpm i --frozen-lockfile ; fi && pnpm run $0 -- $1 $2 $3 $4 $5 $6 $7 $8 $9 && if [ $SERVE = true ] ; then node $OUT/index.js ; fi"]
CMD ["build"]
