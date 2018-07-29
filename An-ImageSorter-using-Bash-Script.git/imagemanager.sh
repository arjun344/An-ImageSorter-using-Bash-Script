tput cup 3 15
echo -e "\e[31;43m \e[1mWelcome To ImageManager \e[0m"

source_folder="$1"

Destination_Folder="$2"

Lower_to_Upper()                                
    {
    echo $1 | tr  "[:lower:]" "[:upper:]"   
    }

Upper_to_lower() 
    {
    echo $1 | tr "[:upper:]" "[:lower:]"
    }

escapeSpaces()
    {
    echo $1 | sed 's/ /\\ /g'
    }

if [ "$#" != "2" ]; 
    then
    	tput cup 4 15
        echo -e "\e[31;43m  Sorry To Proceed !!!  \e[0m"
        tput cup 5 15
        echo -e "\e[31;43m Do Specify Where To Start From And Where To End At \e[0m"
        exit 1
fi

which stat > /dev/null
    if [ $? -eq 1 ]
        then
        	tput cup 4 15
            echo -e "\e[31;43m Stat Command is Not Installed On Your System \e[0m"
            tput cup 5 15
            echo -e "\e[31;43m Install Stat command by Running \e[0m"
            tput cup 6 15
            echo -e "\e[31;43m sudo apt install stat \e[0m"
            exit 2
    fi

which identify > /dev/null
    if [ $? -eq 1 ]
        then
        	tput cup 4 15
            echo -e "\e[31;43m Identify Command Not Installed On Your System \e[0m"
            tput cup 5 15
            echo -e "\e[31;43m Install Identify By Running \e[0m"
            tput cup 6 15
            echo -e "\e[31;43m sudo apt install identify \e[0m"
            exit 3
fi
clear
find "$source_folder" -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.nef" -o -iname "*.png" -o -iname "*.bmp" -o -iname "*.avi" -o -iname "*.flv" -o -iname "*.VOB" -o -iname "*.mov" -o -iname "*.mpg" -o -iname "*.mp4" > images.tmp
cat ./images.tmp | while read f;
    do
        if [ -f "${f}" ]; 
            then
                
                FILETYPE=$(Lower_to_Upper ${f#*.})
                Image_Details=""
                if [ "$FILETYPE" = "JPG" -o "$FILETYPE" = "NEF" ]; 
                    then
                        Image_Details="$(identify -format '%[exif:DateTimeOriginal]' ${f})"
                        Image_Details=${Image_Details%T*}
                fi

                if [ "${Image_Details}" = "" ]; 
                    then
                        Image_Details=$(stat -c %y "$f")
                fi

                y=$(echo $Image_Details | cut -c 1-4)
                m=$(echo $Image_Details | cut -c 6-7)
                d=$(echo $Image_Details | cut -c 9-10)

                destFile=$Destination_Folder/$y/$m/$d/$(basename "${f}")    

                if [ ! -d "$Destination_Folder/$y/$m/$d" ]; 
                    then
                        mkdir -p "$Destination_Folder/$y/$m/$d"
                fi

                if [ -f "${destFile}" ]; 
                    then
                        tput cup 4 15
                        echo -e "\e[31;43m Existing file found. \e[0m"
                        tput cup 5 15
                        echo -e "\e[31;43m Programm Exiting Sorry !!! \e[0m"
                        exit 2

                else
                        mv "$f" "$destFile"
                        
                        echo -e "\e[31;33m \e[1mImage[$f]\e[0m processed\e[0m"
                       
                fi
        else
        	tput cup 4 15
            echo -e "\e[31;43m ${f} \e[0m"
            tput cup 5 15
            echo -e "\e[31;43m  There is Nothing To Proceed \e[0m"
            tput cup 6 15
            echo -e "\e[31;43m Sorry !!! File Not Found \e[0m"
        fi
        #echo "****************************************************************************************************"
done
 tput cup 20 15
 echo -e "\e[43;31m Mission Succesfully finished :-) \e[0m"
 tput cup 7 15
 echo ""
 #echo "****************************************************************************************************"
tput cup 22 15
echo -e "\e[43;31m Do You Want To Remove The Left Empty Folder ? [ 1.(Yes) or 2.(No) ] \e[0m"
tput cup 24 15
read permission

if [ $permission -eq 1 ]
    then

        rm -r $source_folder
        tput cup 26 15
        echo -e "\e[31;43m Folder Removed \e[0m"

    else
    	tput cup 26 15
        echo -e "\e[31;43m Folder retrieved but is empty with subdirectories \e[0m"
    fi
rm -r images.tmp
tput cup 29 15
echo ""
tput cup 29 15
echo -e "\e[31;33m \e[1mDone\e[0m\e[0m"
tput cup 29 15
echo ""
























