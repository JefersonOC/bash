echo '\n[LOTOHARD API]\n';
while true; 
do sleep 5; 
curl http://167.172.220.137:5000/actuator/health
echo '\n'$(date);
done
