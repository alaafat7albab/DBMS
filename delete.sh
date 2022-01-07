#!/bin/bash
source ./show.sh

dropTable(){

    echo "Choose Table To Drop"
    read tableName
    if [[ $tableName == '' ]]
    then
        echo "table name can't be empty"
        dropTable
    elif [[ $tableName == / ]]
    then
        echo "/ is not a table"
        dropTable
    elif [[ -d ./databases/$dbName/$tableName ]]
    then
        clear
        echo "WARNING !!! "
        echo "ALL DATA IN THIS Table WILL BE DELETED !"
        echo "Are You Sure You Want To drop $tableName ? (Y,N)"
        read answer
        until [ flag = 0 ]
        do
            case $answer in
                [Yy] )
                    rm -r ./databases/$dbName/$tableName
                    if [[ $? == 0 ]]
                    then
                        echo "Table $tableName Deleted Successfully"
                    fi
                    break
                ;;
                [Nn] )
                    echo "Canceled"
                    break
                ;;
                *)
                    clear
                    echo "Please Enter Valid Answer (Y,N)"
                    read answer
                ;;
            esac
        done
    else
        # clear
        echo "Table does Not Exist"
        dropTable
    fi
}