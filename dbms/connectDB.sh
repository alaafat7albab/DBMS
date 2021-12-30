if [ $# -eq 1 -a -d $1 ]
then
        ls -d */
	cd $1
        echo "connected to $1"
elif [ $# -lt 1 ]
then
	echo "invalid input"
else
        echo "there in no such a database"
fi

