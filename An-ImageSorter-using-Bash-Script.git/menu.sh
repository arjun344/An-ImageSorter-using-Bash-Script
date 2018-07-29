clear
echo ""
tput clear
 
# Move cursor to screen location X,Y (top left is 0,0)
tput cup 3 15
 
# Set a foreground colour using ANSI escape
echo -e "\e[31;43m \e[1mA BASIC AUTOMATED FILE MANAGEMENT SYSTEM\e[0m"
 
tput cup 5 17
# Set reverse video mode
echo -e "\e[31;43m\e[1m MAIN MENU\e[0m"
 
tput cup 7 15
echo "1. SystemInformation"
 
tput cup 8 15
echo "2. ImageManager"
 
tput cup 9 15
echo "3. Encryption"
 
tput cup 10 15
echo "4. Decryption"
 
# Set bold mode
tput bold
tput cup 12 15
echo "Enter Your Choice [1-4]"
tput cup 14 15
read choice

case $choice in 

	1)
		clear
		bash $HOME/unixproject/systeminformation.sh
		echo ""
		
		echo -e "\e[31;43m\e[1mDo You Wish To Continue ? (1.(Yes) 2.(No)\e[0m"
		read opininion
		if [ $opininion -eq 1 ]
			then

				clear
				bash $HOME/unixproject/menu.sh
			else
				echo -e "\e[31;43m\e[1m Thanks For Using\e[0m"
		fi
		;;
	2)
		
		clear
		bash $HOME/unixproject/imagemanagerdriver.sh
		echo ""
		tput cup 33 15
		echo -e "\e[31;43m\e[1mDo You Wish To Continue ? (1.(Yes) 2.(No)\e[0m"
		tput cup 34 15
		read opininion
		if [ $opininion -eq 1 ]
			then

				clear
				bash $HOME/unixproject/menu.sh
			else
				tput cup 35 15
				echo -e "\e[31;43m\e[1m Thanks For Using\e[0m"
		fi
		;;

	3)
		clear
		bash $HOME/unixproject/encryptfile.sh
		echo ""
		tput cup 33 15
		echo -e "\e[31;43m\e[1mDo You Wish To Continue ? (1.(Yes) 2.(No)\e[0m"
		tput cup 34 15
		read opininion
		if [ $opininion -eq 1 ]
			then

				clear
				bash $HOME/unixproject/menu.sh
			else
				tput cup 35 15
				echo -e "\e[31;43m\e[1m Thanks For Using\e[0m"
		fi
		;;

	4)
		
		clear
		bash $HOME/unixproject/decryptfile.sh
		echo ""
		tput cup 38 15
		echo -e "\e[31;43m\e[1mDo You Wish To Continue ? (1.(Yes) 2.(No)\e[0m"
		tput cup 40 15
		read opininion
		if [ $opininion -eq 1 ]
			then

				clear
				bash $HOME/unixproject/menu.sh
			else
				tput cup 35 15
				echo -e "\e[31;43m\e[1m Thanks For Using\e[0m"
		fi
		
		;;

	*) tput cup 16 15
		echo -e "\e[31;43m\e[1m Sorry you Entered an Invalid Choice !!!\e[0m"
		
		bash menu.sh

esac
