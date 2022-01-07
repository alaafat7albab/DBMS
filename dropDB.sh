#!/bin/bash

read -p "Enter database name " dbName
if [ -d ./databases/$dbName ]
then
        rm -r ./databases/$dbName
	echo "$dbName database has been deleted"
else
        echo "there in no such a database"
fi

