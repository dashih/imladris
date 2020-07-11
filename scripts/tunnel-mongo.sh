LOCAL_PORT=5903
echo "localhost:$LOCAL_PORT"
ssh -L localhost:$LOCAL_PORT:localhost:27017 -N dss4f@192.168.1.42
