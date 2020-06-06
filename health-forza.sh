echo '\n[FORZA API]\n';
while true; 
do sleep 5; 
curl http://157.245.168.143:5000/actuator/health
echo '\n'$(date);
done
