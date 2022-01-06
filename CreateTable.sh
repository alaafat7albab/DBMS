#!/bin/bash
source ./DataType.sh
source ./NullValues.sh

creatTable(){
    dbName=$1
    echo "Enter Table Name"
    echo " "
    read tableName
    clear
    if [[ ! $tableName =~ ^[a-zA-Z0-9]*$ ]] || [[ $tableName == '' ]]
    then 
        echo "Not Valid Name Of Table"
        echo " "
        creatTable $dbName
    elif [[ -d ./databases/$dbName/$tableName ]]
    then
        echo "This Table Already Exist"
        echo " "
        creatTable $dbName
    else 
        mkdir ./databases/$dbName/$tableName
        touch ./databases/$dbName/$tableName/$tableName"_"desc
        touch ./databases/$dbName/$tableName/$tableName"_"data
        echo "Enter Number Of Columns: "
        echo " "
        read colNum
        clear
        
        until [[ $colNum =~ ^[2-9]+$ ]]
        do 
            echo "Table shoud have at least 2 columns, string not allowed"
            echo "Enter columns Number: "
            echo " "
            read colNum
            clear
        done

        #seq command to print number of lines in file according to number of columns
        for i in $(seq $colNum)
        do 
            if [[ i -eq 1 ]]
            then 
                echo "Please Enter The coulmn will be primary key"
                echo " "
                read colName
                clear
                until [[ $colName =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]]
                do 
                    echo "Invalid Primary Key Name"
                    echo "Enter Primary Key Name: "
                    echo " "
                    read colName
                    clear
                done
                echo -n  $colName >> ./databases/$dbName/$tableName/$tableName"_"desc
                dataType
                echo -e  ":PK" >> ./databases/$dbName/$tableName/$tableName"_"desc
            else
                tableCols=$(awk 'BEGIN{FS = ":"} {Print $1})' ./databases/$dbName/$tableName/$tableName'_desc')
                until [[ $colName =~ ^[a-zA-Z]+[a-zA-Z0-9]*$ ]] && [[ ! $tableCols == *"$colName"* ]]
                do
                    echo "Column Name Must be String and Start With Charachter and Not Repeated Before"
                    echo "enter the name of column $i : "
                    read colName
                    clear
                done
                echo -n $colName >> ./databases/$dbName/$tableName/$tableName"_"desc
                dataType
                echo  -e ":" >> ./databases/$dbName/$tableName/$tableName"_"desc
            fi
        done
        echo ""
        echo "========================================="
        echo "$tableName table is created successfully"
        echo "========================================="
        echo ""

    fi
}

