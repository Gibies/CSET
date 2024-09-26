#!/bin/bash
SELF=$(realpath ${0})
export SITEFLDR=${SELF%/*}
export SITENAME=${SITEFLDR##*/}
export GITROOT=${SELF%/site/*}
export PKG_NAME=${GITROOT##*/}

cd ${GITROOT}
UTFList=$(git ls-files --others --exclude-standard)

echo ${GITROOT}

for utf in ${UTFList}; do
echo ${utf}
done
ssh -x utility01 'cd '${GITROOT}'; git add '${UTFList}' ; git status'
