echo 'Preparing environment'
while ! [ -x "$(command -v ansible)" ]
do
  echo 'Waiting...' >&2
  sleep 5
done
echo 'Ready to go!'
