echo 'Prepping environment'
while ! [ -x "$(command -v operator-sdk)" ]
do
  echo 'Waiting...' >&2
  sleep 5
done
cd /root/tutorial
echo 'Ready to go!'
