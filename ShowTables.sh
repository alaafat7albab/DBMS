showTable(){
    echo "====================================="
if [[ `ls ./databases/"$1"` == "" ]]
then
    clear
    echo "There No Tables To Show"
else
    clear
    echo "exsiting tables : "
    echo `ls ./databases/"$1" `
    echo "=================================="
fi
}
showTable
