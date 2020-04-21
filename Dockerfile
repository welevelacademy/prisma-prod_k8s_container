ARG tag

FROM prismagraphql/prisma-prod:$tag

RUN apk add --update libintl && apk add --virtual build_deps gettext

COPY ./prerun_hook.sh /app/prerun_hook.sh

CMD /app/start.sh