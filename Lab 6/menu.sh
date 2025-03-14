#!/bin/bash

while true; do
# 2.1 - Main screen
    whiptail --title "Menu" --yesno "Would like to proceed or exit the program?" 10 50

# Check if the user select to proceed
    
    if [ $? -eq 0 ]; then
# 2.2 - Second screen
        choice=$(whiptail --title "Menu" --menu "Choose a tool:" 15 50 4 \
            "1" "Use AWK" \
            "2" "Use GREP" \
            "3" "Exit" 3>&1 1>&2 2>&3)

# 2.3 - When user selects AWK
        if [ "$choice" == "1" ]; then
            filename=$(whiptail --title "Menu" --inputbox "Enter the name of the file you wish to awk:" 10 50 3>&1 1>&2 2>&3)
                
            output=$(awk -F, '{print $2}' "$filename" | tr -d '\r')
            whiptail --title "AWK Result" --msgbox "$output" 20 50
            
        fi

# 2.4 - When user selects GREP
        if [ "$choice" == "2" ]; then
            filename=$(whiptail --title "Menu" --inputbox "Enter the name of the file you wish to grep:" 10 50 3>&1 1>&2 2>&3)
            
            output=$(grep 'e' "$filename" | tr -d '\r')
            whiptail --title "GREP Result" --msgbox "$output" 20 50
        fi

# 2.8 - Return to the main screen
    else
        exit 0
    fi
done

