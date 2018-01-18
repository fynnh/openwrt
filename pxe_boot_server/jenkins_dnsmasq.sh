DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ "$(pidof dnsmasq)" ] 
then
	echo "dnsmasq already running"
  # process was found
else
	echo "Start dnsmasq in background"
	$DIR/start_dnsmasq.sh &
	sleep 1s
	if [ "$(pidof dnsmasq)" ] 
	then
		echo "OK"
	else
		echo "Something went wrong"
	fi

  # process not found
fi
