#!/bin/bash 

nullValues(){
    echo "Should $colName Accept Null Values, Please Choose Number"
    echo "1- Yes"
    echo "2- No"
    read answer
    clear 
    case $answer in 
    1)
        echo -e -n ": Null" >> ./databases/$dbName/$tableName/$tableName"_"desc
        ;;
    2)
        echo -e -n ": Not Null" >> ./databases/$dbName/$tableName/$tableName"_"desc
        ;;
    *)
        echo "It's Not a vailed Option"
        nullValues
        ;;
    esac
}
