# Shell Script To Show System Information :
# First Part of the Project :
#tput cup 3 15
echo -e "\e[31;43m		HOSTNAME INFORMATION 		\e[0m"

echo ""
#tput cup 5 17
hostnamectl

echo ""

# -File system disk space usage:
#tput cup 7 17
echo -e "\e[31;43m		FILE SYSTEM DISK SPACE USAGE 		\e[0m"

echo ""
#tput cup 9 17
df -h

echo ""

# -Free and used memory in the system:	
echo -e "\e[31;43m 	    FREE AND USED MEMORY 		\e[0m"

echo ""

free

echo ""

# -System uptime and load:
echo -e "\e[31;43m	    SYSTEM UPTIME AND LOAD 		\e[0m"

echo ""

uptime

echo ""

# -Logged-in users:
echo -e "\e[31;43m		CURRENTLY LOGGED-IN USERS 		\e[0m"

echo ""

who

echo ""

# -Top 5 processes as far as memory usage is concerned
echo -e "\e[31;43m	    TOP 5 MEMORY-CONSUMING processes	\e[0m"

echo ""

ps -eo %mem,%cpu,comm --sort=-%mem | head -n 6

echo ""


# -Alert when file system usage surpasses a defined limit

echo -e "\e[31;43m	    CHECKING FILE SYSTEM USAGE		\e[0m"

echo ""

THRESHOLD=30

while read line; 
do

# This variable stores the file system path as a string
FILESYSTEM=$(echo $line | awk '{print $1}')

# This variable stores the use percentage (XX%)
PERCENTAGE=$(echo $line | awk '{print $5}'
)
# Use percentage without the % sign.
USAGE=${PERCENTAGE%?}

if [ $USAGE -gt $THRESHOLD ]; 
	then


echo "The remaining available space in $FILESYSTEM is critically low. Used: $PERCENTAGE"

fi

done < <(df -h --total | grep -vi filesystem)

echo ""

echo -e "\e[1;32mDone.\e[0m"
