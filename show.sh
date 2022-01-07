
showTables(){
    echo "======================="
    if [[ $(ls ./databases/$1 ) == "" ]]
    then
        clear
        echo " There is no Tables "
        
    else
        clear
        echo "existing tables :"
        ls ./databases/$1
        echo "======================="
    fi
}
