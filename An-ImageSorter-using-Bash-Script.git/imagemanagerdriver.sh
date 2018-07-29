tput cup 3 15
echo -e "\e[31;43m \e[1m Welcome To ImageManager  \e[0m"
tput cup 5 15
echo ""
tput cup 6 15
echo -e "\e[31;33mEnter The Name Of The Source Folder\e[0m"
tput cup 7 15
read sourcefolder

tput cup 8 15
echo ""
tput cup 9 15
echo -e "\e[31;33mEnter The Name Of The Destination Folder\e[0m"
tput cup 10 15
read destinationfolder
tput cup 11 15
echo ""
tput cup 12 15
echo -e "\e[31;33mInitiating Process\e[0m"
tput cup 13 15
echo ""
clear
bash imagemanager.sh $HOME/$sourcefolder $HOME/$destinationfolder
