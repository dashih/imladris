localPort=
targetHost=
if [ -n "$1" ] || [ -n "$2" ]
then
    localPort="$1"
    targetHost="$2"
else
    echo "Bad usage. Example: tunnel-thru-router.sh 5907 192.168.1.1:443"
    exit 1
fi

echo "localhost:$localPort connects to $targetHost"
ssh -L localhost:$localPort:$targetHost -N root@192.168.1.1
