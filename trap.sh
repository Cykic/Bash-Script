
function ctrl_c(){
    echo "**** Ending Attack ****"
    echo done
    }
    
    trap ctrl_c INT
    
for i in 'seq 1 10'; do
    sleep 10
    echo -n "."
done
