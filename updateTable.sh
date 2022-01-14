

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
fieldNumber=`awk -F: '{ if("'$cname'"==$1){print NR}}' ./databases/$dbName/$tname/$tname"_"desc`
#awk -F: 'if( $cname == $1 ) {print $1; result=1 ,fieldNumber=}'  ./databases/$dbName/$tname/$tname"_"desc
if [[ $result==1 && -n $result ]]
then
read -p  "enter value of primary key in where closure: " val;
read -p  "enter newVal " newVal;
echo $newVal
record=`awk -F: '{ if('$val'==$1){print $0}}' ./databases/$dbName/$tname/$tname"_"data`
echo $record
#recordLine=`awk 'BEGIN{FS=":"}{ if('$record'==NR){for(i=0;i<=NF;i++){if(i=="'$cname'") print $i}}}' ./databases/$dbName/$tname/$tname"_"data`
#sed -i "s/${search}/${replace}/g"
#sed -i "s/${record}/'$"$fieldNumber"'/'$newValue'/g" ./databases/$dbName/$tname/$tname"_"data
#sed -i 's/$'$fieldNumber'/$newVal/g' ./databases/$dbName/$tname/$tname"_"data
#sed -i 's/$"$fieldNumber"/$newVal/g'  
#sed -i "s/^$'$fieldNumber': .*/$newVal/" ./databases/$dbName/$tname/$tname"_"data
awk -F:  ''$val'==$1  {$'$fieldNumber'="'$newVal'"}{for(i=1 ;i<=NF ;i++ ) { if (i==NF) print $i; else printf "%s",$i":"} }' ./databases/$dbName/$tname/$tname"_"data >> out.tmp 
cat out.tmp > ./databases/$dbName/$tname/$tname"_"data 
rm out.tmp
#awk -F: '{ if('$fieldNumber'==NF) {newRecord='$newVal'} else {newRecord=$NF}}' ./databases/$dbName/$tname/$tname"_"data
fi
else
updateTable
fi
}
