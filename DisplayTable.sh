#!/bin/bash
. ./ShowTables.sh 


displayTable(){
    set +x 
    while true
    do    
        echo "Please Enter Table Name"
        read tableName
        if [[ $tableName == / ]]
        then 
            showTable $dbName
            echo "/ Is Not a Table Name"
            displayTable
        elif [[ $tableName == '' ]]
        then 
            showTables $dbName
            echo "Table Name Can not be Empty"
            displayTable
        elif [[ ! -d ./databases/$dbName/$tableName ]]
        then
            showTable $dbName
            echo "No Exiting Tables, Please Choose Another Name"
            displayTable
        else 
            clear
            echo "1 - Diplay Table $tableName Description"
            echo "2 - Diplay Table $tableName Data"
            read answer

            case $answer in
                1) 
                    clear
                    cat ./databases/$dbName/$tableName/$tableName"_"des 
                    echo " "
                    break
                    ;;
                2)
                    clear 
                    cat ./databases/$dbName/$tableName/$tableName"_"data
                    echo " "
                    break
                    ;;
                *)
                    clear
                    echo "it's not option"
            esac
        fi
        break
    done
    set -x
}