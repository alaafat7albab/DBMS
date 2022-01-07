#to list directories only
ls ./databases 2> err > output
if [ $? -eq 0 ]
then  
	ls ./databases
else
echo "there no databases to show"
fi
