count=$(docker ps -a | grep jpetazzo/clock -c)
if [[ count -ge 3 ]]; then     echo "done"; fi