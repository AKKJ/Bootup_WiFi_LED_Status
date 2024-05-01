# check if /sys/class/leds has LED0 or LED1 or PWR folder. 
# see the following link - https://raspberrypi.stackexchange.com/questions/143740/missing-sys-class-leds-led0-and-sys-class-leds-led1-directories-on-pi3-model-b
  # In this example the sh script need ON or OFF command when executing "./onBoardLEDBlink.sh ON"

# run the following command 
  # In this case the file is saved as onBoardLEDBlinkIP.sh
  # sudo chmod +x onBoardLEDBlinkIP.sh
  # ./onBoardLEDBlinkIP.sh


_IP=$(hostname -I) || true


while :
do

    if [ "$_IP" ]; then
        echo "If loop"
        # printf "My IP address is %s\n" "$_IP"
        # echo "Online"
        #https://stackoverflow.com/questions/617182/how-can-i-suppress-all-output-from-a-command-using-bash
        : $(echo 255 |sudo tee /sys/class/leds/PWR/brightness)
        #https://www.freecodecamp.org/news/bash-sleep-how-to-make-a-shell-script-wait-n-seconds-example-command/#:~:text=How%20to%20Use%20the%20Bash,or%20a%20floating%20point%20number.
        sleep 0.5
        : $(echo 0 |sudo tee /sys/class/leds/PWR/brightness)
        sleep 0.5
    else
        # echo "Offline"
        #https://stackoverflow.com/questions/617182/how-can-i-suppress-all-output-from-a-command-using-bash
        : $(echo 255 |sudo tee /sys/class/leds/PWR/brightness)
        #https://www.freecodecamp.org/news/bash-sleep-how-to-make-a-shell-script-wait-n-seconds-example-command/#:~:text=How%20to%20Use%20the%20Bash,or%20a%20floating%20point%20number.
        sleep 1
        : $(echo 0 |sudo tee /sys/class/leds/PWR/brightness)
        sleep 1
    fi
done

