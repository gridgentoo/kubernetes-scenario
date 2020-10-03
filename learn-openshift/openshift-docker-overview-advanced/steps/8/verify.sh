count=$(docker ps | grep jpetazzo/clock -c)
if [[ count -eq 0 ]]; then     echo "done"; fi