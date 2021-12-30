if [ $# -eq 1 -a -d $1 ]
then
        rm -r $1
        echo "$1 deleted"
elif [ $# -lt 1 ]
then
	echo "invalid input"
else
        echo "there in no such a database"
fi

