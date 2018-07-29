tput cup 3 15
echo ""
tput cup 5 15
echo -e "\e[31;43m******************** \e[1mWelcome To The File Decrypter ********************\e[0m"
tput cup 6 15
echo ""
tput cup 7 15
echo -e "\e[33;31mEnter The\e[0m \e[1mDirectory\e[0m \e[33;31mWhere The File Is Present : \e[0m"

tput cup 9 15
read dire

if [ -d "$HOME/$dire" ]
	
	then

		echo ""
		tput cup 11 15
		echo -e "\e[33;31mEnter the Exact\e[0m \e[1mFile Name with extension( example; filename.extension.gpg )\e[0m"
		tput cup 13 15
		read file;

		echo ""

		if [ -f "$HOME/$dire/$file" ]

			then

				tput cup 15 15
				echo -e "\e[1mDecrypting file. . . . . .\e[0m"
				echo ""
				tput cup 17 15
				echo -e "\e[1mEnter the Name For The New File\e[0m"
				tput cup 19 15
				read newname
				echo ""
				tput cup 22 15
				gpg -o $HOME/$dire/$newname -d $HOME/$dire/$file

				echo ""
				tput cup 25 15
				echo -e "\e[33;31m\e[1mFile Decrypted Succesfully \e[0m"
				echo""
				tput cup 27 15
				echo -e "\e[33;31mNow removing the Decrypted file. . . . . \e[0m"
				echo ""

				rm -rf $HOME/$dire/$file
				tput cup 29 15
				echo -e "\e[1mEnter the Location where File Is To be Stored \e[0m"
				tput cup 31 15
				read destination
				echo ""

				if [ -d "$HOME/$destination" ]

					then

						tput cup 33 15
						echo -e "\e[31;33mMoving The Decrypted File To \e[0m\e[1m$destination Folder . . . .\e[0m"

						mv $HOME/$dire/$newname $HOME/$destination
						echo""
						tput cup 35 15
						echo -e "\e[31;43m***************** \e[1mTask Completed ***************** \e[0m"

				else

						mkdir $HOME/$destination
						tput cup 33 15
						echo -e "\e[31;33mMoving The Encrypted File To \e[0m\e[1m$destination Folder . . . .\e[0m"
						tput cup 34 15
						mv $HOME/$dire/$newname $HOME/$destination
						echo""
						tput cup 36 15
						echo -e "\e[31;43m***************** \e[1mTask Completed ***************** \e[0m"
				fi
		else

			clear
			tput cup 3 15
			echo -e "\e[33;31mEnter a Valid File Name. . . . . \e[0m"
			bash $HOME/unixproject/decryptfile.sh
			exit 2

		fi
else

	clear
	tput cup 5 15
	echo -e "\e[33;31mEnter a Valid Directory Name. . . . . \e[0m"
	bash $HOME/unixproject/decryptfile.sh
	exit 2

fi

exit 0
