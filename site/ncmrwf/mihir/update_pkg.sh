#!/bin/bash
SELF=$(realpath ${0})
export SITEFLDR=${SELF%/*}
export SITENAME=${SITEFLDR##*/}
export GITROOT=${SELF%/site/*}
export PKG_NAME=${GITROOT##*/}

HOST=$(hostname)

if [ ${HOST:0:6} == "elogin" ]; then
ssh -x utility01 'cd '${GITROOT}'; git pull ; git status'
else
cd ${GITROOT}; git pull ; git status
fi
