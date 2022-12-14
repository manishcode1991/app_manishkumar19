#!/bin/bash
DEFAULT_VALUE="DEV"
if [[ -z "${NODE_ENV}" ]]; then
  CURRENT_ENV=${DEFAULT_VALUE}
else
  CURRENT_ENV="${NODE_ENV}"
fi
echo ${CURRENT_ENV}
if [[ ${CURRENT_ENV} == ${DEFAULT_VALUE} ]]; then
  npm start
else
  npm run start-prod
fi
exec $@