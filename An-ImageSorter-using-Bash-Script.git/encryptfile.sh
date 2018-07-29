#!/bin/bash
tput cup 3 15
echo ""
tput cup 5 15
echo -e "\e[31;43m******************** \e[1mWelcome To The File Encrypter ********************\e[0m"
tput cup 6 15
echo ""
tput cup 7 15
echo -e "\e[33;31mEnter The\e[0m \e[1mDirectory\e[0m \e[33;31mWhere The File Is Present : \e[0m"

tput cup 9 15
read dire

if [ -d "$HOME/$dire" ]
	
	then

		tput cup 10 15
		echo ""
		tput cup 12 15
		echo -e "\e[33;31mEnter the Exact\e[0m \e[1mFile Name with extension\e[0m"
		tput cup 14 15
		read file;

		echo ""

		if [ -f "$HOME/$dire/$file" ]

			then
				tput cup 15 15
				echo -e "\e[1mencrypting file. . . . . .\e[0m"
				tput cup 16 15
				echo ""
				tput cup 17 1
				gpg -c $HOME/$dire/$file
				tput cup 18 15
				echo ""
				tput cup 19 15
				echo -e "\e[33;31m\e[1mFile Encrypted Succesfully \e[0m"
				tput cup 20 15
				echo""
				tput cup 21 15
				echo -e "\e[33;31mNow removing the original file. . . . . \e[0m"
				tput cup 22 15
				echo ""

				rm -rf $HOME/$dire/$file
				tput cup 23 15	
				echo -e "\e[1mEnter the Location where File Is To be Stored \e[0m"
				tput cup 24 15
				read destination
				tput cup 25 15
				echo ""

				if [ -d "$HOME/$destination" ]

					then

						tput cup 26 15
						echo -e "\e[31;33mMoving The Encrypted File To \e[0m\e[1m$destination Folder . . . .\e[0m"

						mv $HOME/$dire/$file.gpg $HOME/$destination
						tput cup 27 15
						echo""
						tput cup 28 15
						echo -e "\e[31;43m***************** \e[1mTask Completed ***************** \e[0m"

				else

						mkdir $HOME/$destination
						tput cup 29 15
						echo -e "\e[31;33mMoving The Encrypted File To \e[0m\e[1m$destination Folder . . . .\e[0m"

						mv $HOME/$dire/$file.gpg $HOME/$destination
						tput cup 30 15
						echo""
						tput cup 31 15
						echo -e "\e[31;43m***************** \e[1mTask Completed ***************** \e[0m"
				fi
		else

			clear
			tput cup 3 15
			echo -e "\e[33;31mEnter a Valid File Name. . . . . \e[0m"
			bash encryptfile.sh
			exit 2

		fi
else

	clear
	tput cup 3 15
	echo -e "\e[33;31mEnter a Valid Directory Name. . . . . \e[0m"
	bash encryptfile.sh
	exit 2

fi

exit 0






