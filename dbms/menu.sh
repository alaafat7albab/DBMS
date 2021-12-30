
select choice in "create database" "List database" "connect to databse" "drop database" 
do
	case $choice in 
		"create database")
			echo "enter database name "
			read option
			./createDB.sh $option
			;;
		"List database") 
			./listDB.sh
                        ;;
		 "connect to databse")
                        echo "enter database name"
			read dbName 
			./connectDB.sh $dbName
                        ;;

 		"drop database")
                        echo "enter database name"
			read dbName 
			./dropDB.sh $dbName
                        ;;
		*)
			echo "not valid option"
			exit
			;;
	esac

done 
