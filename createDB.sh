read -p "Enter database name " dbName

if [ -d ./databases/$dbName ]
then
	echo " this database already exist"
else
	mkdir ./databases/$dbName
	echo "$dbName directory created"
fi
