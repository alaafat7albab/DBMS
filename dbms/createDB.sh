if [ $# -eq 1 -a -d $1 ]
then
	echo " this database already exist"
elif [ $# -eq 1 ]
then
	mkdir $1 
	echo "$1 directory created"
else
	echo "not invalid input"
fi
