#!/bin/bash

# definition of default variables
DEBUG_MODE="disable"
COMPRESS_FORMAT="tar"
DISTANCE_PATH=""

while getopts n:b:f:p:d: flag
do
    case "${flag}" in
        # creating new branch  
        n) git branch ${OPTARG};;
        # switching to selected branch
        b) git checkout ${OPTARG} >&-;;
        # getting compress format from user
        f) COMPRESS_FORMAT=${OPTARG} 
            
           # checking compress format. if it is invalid, the script will exit
           if [ $COMPRESS_FORMAT != "tar" ] && [ $COMPRESS_FORMAT != "zip" ] 
           then 
                echo "################################################################################"
                echo "[ERROR] Attention! Please enter a valid compress format"
                echo "################################################################################"
              break 
           fi
        ;;
        # getting compressed file path
        p) DISTANCE_PATH=${OPTARG}"/";;
        # getting debug mode option that enabled or disabled
        d) DEBUG_MODE=${OPTARG};;

    esac

done

CURRENT_BRANCH="$(git branch --show-current)"

# controlling main branch 
if [ ${CURRENT_BRANCH} = "main" ] || [ ${CURRENT_BRANCH} = "master" ]
then
    echo "################################################################################"
    echo "[WARN] Attention! The '${CURRENT_BRANCH}' branch will be built!"
    echo "################################################################################"
else
    echo "################################################################################"
    echo "[INFO] The '${CURRENT_BRANCH}' branch will be built!"
    echo "################################################################################"
fi

# compiling the project
if [[ ${DEBUG_MODE} = "enable"  ]]
then

    mvn package -X
else
    mvn package
fi

ARTIFACT_FILE="$(ls target/ | grep \.jar$)"


# compressing the articaft
if [[ $COMPRESS_FORMAT = "zip" ]]
then
   zip $DISTANCE_PATH${CURRENT_BRANCH}".zip"  "target/"$ARTIFACT_FILE
else 
   tar -czf $DISTANCE_PATH${CURRENT_BRANCH}".tar.gz"  "target/"$ARTIFACT_FILE 
fi




