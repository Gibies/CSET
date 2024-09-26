#!/bin/bash
SELF=$(realpath ${0})
export SITEFLDR=${SELF%/*}
export SITENAME=${SITEFLDR##*/site/}
export GITROOT=${SELF%/site/*}
export PKG_NAME=${GITROOT##*/}

echo ${SITENAME}

###########################################################################################
helpdesk()
{
echo -e "Usage: \n $0"
                        echo "options:"
			echo "-h	--help		Help"
			echo "-m	--msg		Short Message for git commit"
			echo "-p	--pkg		Package Name"
                        exit 0
}
###########################################################################################
options()
{
while test $# -gt 0; do
        case "$1" in
                -h|--help) 	helpdesk;;
		-m|--msg)	shift; MSGKEY=$1; shift;;
		-p|--pkg)	shift; PKG_NAME_LIST=$1; shift;;
		*)		shift;;
	esac
done
}
###########################################################################################
options $(echo $@  | tr "=" " ")
###########################################################################################
sh ${SITEFLDR}/update_pkg.sh 
sh ${SITEFLDR}/addfilesto_pkg.sh 
ssh -x utility01 'cd '${GITROOT}'; git commit -a -m "Updated '${PKG_NAME}' for '$(echo ${MSGKEY} | tr "_" " " )'"; git push'
