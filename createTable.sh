shopt -s nocasematch
echo "enter table name"
read tableName
if [ -f $tableName ]
then 
echo "this table is already exist"
else 
touch $tableName
echo "enter number of columns"
read columnNumber
typeset -i index=1
while [ $index -le $columnNumber ];
do 
	if [ $index -eq 1 ]
	then
	echo "consider coulmn number 1 is the primary key "
	fi	
	echo "column number $index name"
	read coulmnName
	echo "column datatype (int or string)"
	select datatype in  "int" "string"
	do
	case $datatype in
	"int" ) 
	datatype="int"
	break
	;;
	"string" )
	datatype="string"
	break;	
	;;	
	* )
	echo "Invalid datatype";
	read -p "Enter column datatype : [string/int]" datatype;
	;;
	esac	
	done
	echo $datatype
#echo -n --> don't output the trailing newLine
	echo -n $coulmnName":" >> $tableName;	
	echo $index
	if [ $index -eq $columnNumber ]
	then
	echo $datatype >> $tableName;
	else
	echo -n $datatype":" >> $tableName;
	fi
	index=$index+1
done
echo "$tableName has been created"
fi


