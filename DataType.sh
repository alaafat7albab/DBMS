#!/bin/bash

dataType(){
loop=1
while [ $loop -eq 1 ]
do
    echo "please Enter number of choice"
    echo "1- Data Type of column $colName is string"
    echo "2- Data Type of column $colName is integer"
    read colType
    clear
    case $colType in
        1)
            echo -e -n ": String" >> ./databases/$dbName/$tableName/$tableName"_"desc
            loop=0
            ;;
        2)
            echo -e -n ": interger" >> ./databases/$dbName/$tableName/$tableName"_"desc
            loop=0
            ;;
        *)
            echo "It's Not Valid Option"
            dataType
            ;;
    esac
done
}
