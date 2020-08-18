echo '\n[ECONT API]\n';
while true; 
do sleep 5; 
curl http://64.225.50.155:5000/actuator/health
echo '\n'$(date);
done
