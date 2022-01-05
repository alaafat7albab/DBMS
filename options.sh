#!/bin/bash 

select choice in "Create Table" "Insert Table" "Display Table" "Display Data" "Update Table" "Delete Table" "Delete Data" "Alter Table" "Back"
do
    case $choice in 
        "Create Table") 
            . ./CreateTable.sh
            ;;
        "Insert Table") 
            . ./Insert.sh
            ;;
        "Display Table") 
            . ./DisplayTable.sh
            ;;
        "Display Data") 
            . ./DisplayData.sh
            ;;
        "Update Table") 
            . ./UpdateTable.sh
            ;;
        "Delete Table") 
            . ./DropTable.sh
            ;;
        "Delete Data")
            . ./DeleteTable.sh
            ;;
        "Alter Table")
            . ./AlterTable.sh
            ;;
	"Back")
	   exit
	    ;;
	 *)
            echo "it's not an Option"
            ;;

    esac
done
