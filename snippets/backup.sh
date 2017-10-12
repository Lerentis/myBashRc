#!/bin/bash

function usage()
{
	echo "Usage:"
	echo ""
	echo "-s <Source Directory> "
	echo "-d <Designation Directory> "
	echo "-h Prints this help"	
	exit 1;
}

if [[ $1 == "" ]]; then
	usage
fi

while getopts :s:d:h FLAG; do
  case $FLAG in
    s) 
      SOURCEDIR=$OPTARG
      ;;
    d) 
      BACKUPDIR=$OPTARG
      ;;
    h)  
      usage
      ;;
    \?)
      echo -e \\n"Option -${BOLD}$OPTARG${NORM} not allowed."
      usage
      ;;
  esac
done

shift $((OPTIND-1))


date=`date "+%Y-%m-%dT%H:%M:%S"`

if [ ! -d "$BACKUPDIR" ]
then
    echo "Directory for backup is missing, exiting!" >&2
    exit 1
fi

rsync -qazPE --delete --delete-excluded --link-dest=$BACKUPDIR/current \
    $SOURCEDIR/ $BACKUPDIR/back-$date/ \
    && rm -f $BACKUPDIR/current && ln -s $BACKUPDIR/back-$date $BACKUPDIR/current