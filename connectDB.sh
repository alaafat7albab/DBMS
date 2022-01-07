#!/bin/bash
echo "available databases"
ls ./databases 
read -p "Enter database name " dbName

if [ -d ./databases/$dbName ]
then

	ls ./databases/$dbName
        echo "connected to $dbName"

else
        echo "there in no such a database"
fi

