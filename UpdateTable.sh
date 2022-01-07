echo "available Tables in $dbName "
ls ./databases/$dbName
function updateTable(){
read -p  "enter table name to update in : " tname;
if [ -d ./databases/$dbName/$tname ]
then
echo "coulmns in the table " 
column  ./databases/$dbName/$tname/$tname"_"desc -t -s ":"
read -p  "enter coulmn name : " cname;
result=`awk -F: '{ if("'$cname'"==$1){print result=1}}' ./databases/$dbName/$tname/$tname"_"desc`
fieldNumber=`awk -F: '{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$cname'")print $i}}}' ./databases/$dbName/$tname/$tname"_"data`
#awk -F: 'if( $cname == $1 ) {print $1; result=1 ,fieldNumber=}'  ./databases/$dbName/$tname/$tname"_"desc
echo $fieldNumber
echo $result
if [[ $result==1 ]]
then
read -p  "enter value of primary key in where closure: " val;
read -p  "enter newVal " newVal;
record=`awk -F: '{ if('$val'==$1){print $0}}' ./databases/$dbName/$tname/$tname"_"data`
echo $record
#recordLine=`awk 'BEGIN{FS=":"}{ if('$record'==NR){for(i=0;i<=NF;i++){if(i=="'$cname'") print $i}}}' ./databases/$dbName/$tname/$tname"_"data`
#ed -i "s/${search}/${replace}/g"
#sed -i "s/${record}/'$"$fieldNumber"'/'$newValue'/g" ./databases/$dbName/$tname/$tname"_"data
#sed -i 's/$'$fieldNumber'/$newVal/g' ./databases/$dbName/$tname/$tname"_"data
#sed -i 's/$"$fieldNumber"/$newVal/g'  
#awk -F: '{ if('$val'==$1) {echo $fieldNumber}}' ./databases/$dbName/$tname/$tname"_"data
fi
else
updateTable
fi
}
updateTable
