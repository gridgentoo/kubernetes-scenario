echo 'Prepping environment'
while ! [ -x "$(command -v oc)" ]
do
  echo 'Waiting...' >&2
  sleep 5
done
echo 'Ready to go!'
