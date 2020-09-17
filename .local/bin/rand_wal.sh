while true
do
   sleep 1h &
   wait
   /home/jm/.local/bin/wal_select.sh &
done
