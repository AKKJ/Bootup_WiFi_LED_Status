#!/bin/bash


wget -q --spider http://google.com

while :
do 

   if [ $? -eq 0 ]; then
      # echo "Online"
      #https://stackoverflow.com/questions/617182/how-can-i-suppress-all-output-from-a-command-using-bash
      : $(echo 255 |sudo tee /sys/class/leds/led0/brightness) 
      #https://www.freecodecamp.org/news/bash-sleep-how-to-make-a-shell-script-wait-n-seconds-example-command/#:~:text=How%20to%20Use%20the%20Bash,or%20a%20floating%20point%20number.
      sleep 0.5
      : $(echo 0 |sudo tee /sys/class/leds/led0/brightness)
      sleep 2      
   else
      # echo "Offline"
      #https://stackoverflow.com/questions/617182/how-can-i-suppress-all-output-from-a-command-using-bash
      : $(echo 255 |sudo tee /sys/class/leds/led1/brightness) 
      #https://www.freecodecamp.org/news/bash-sleep-how-to-make-a-shell-script-wait-n-seconds-example-command/#:~:text=How%20to%20Use%20the%20Bash,or%20a%20floating%20point%20number.
      sleep 0.5
      : $(echo 0 |sudo tee /sys/class/leds/led1/brightness)
      sleep 2            
   fi

done