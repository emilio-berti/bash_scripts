if [ "$1" == "-h" ]; then
    echo "Usage: `basename $0`
    Delete all files older than 'x' minutes every 'y' seconds.
      delold x y
      - x is number of minutes
      - y is the number o seconds"
    exit 0
fi

while [ 1 ] 
do
	find . -mmin +$1 -delete
	sleep $2
done