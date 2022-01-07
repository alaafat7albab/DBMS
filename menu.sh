#!/bin/bash

select choice in "create database" "List database" "connect to databse" "drop database" 
do
	case $choice in 
		"create database")
			. ./createDB.sh 
			;;
		"List database") 
			. ./listDB.sh
                        ;;
		 "connect to databse")
             		. ./connectDB.sh
                        ;;

 		"drop database")
			. ./dropDB.sh 
                        ;;
		*)
			echo "not valid option"
			exit
			;;
	esac

done 
