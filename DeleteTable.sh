#!/bin/bash
source ShowTables.sh

dropTable(){
    #flags are just variables used to keep track of the state of something
    flag=1
    echo "choose Table To Drop"
    read tableName
    if [[ $tableName == '' ]]
    then
        echo "Table Name Can not be empty"
        dropTable
    elif [[ $tableName == / ]]
    then
        echo "/ Not A Table Name"
        dropTable
    elif [[ -d ./databases/$dbName/$tableName ]]
    then 
        echo "WARNING !!"
        echo "All Data In This Table Will Be Delete!"
        echo "Are You Sure You Want to Drop This Table? (Y,N)"
        read answer
        until [[ flag = 0 ]]
        do
            case $answer in
            [Yy]) 
                    rm -r ./databases/$dbName/$tableName
                    if [[ $? == 0 ]]
                    then 
                        echo "====================================="
                        echo "Table $tableName Deleted Successfully"
                        echo "====================================="
                    fi
                    break
                    ;;
            
            [Nn]) 
                    echo "Canceld"
                    break
                    ;;
            
            *)
                    clear
                    echo "It's Not Vaild Option, Please Choose (Y,N)"
                    read answer
                    ;;
            esac                   
        done
    else
        echo "Table does Not Exist"
        dropTable
    fi
}
