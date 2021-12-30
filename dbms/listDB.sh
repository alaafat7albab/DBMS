#to list directories only
ls -d */ 2> err > output
if [ $? -eq 0 ]
then  
	ls -d */
else
echo "there no databases to show"
fi
