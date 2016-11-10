##############################################
## setting installation interface
##############################################

i=0 &&
RED='\033[0;31m' &&
GREEN='\033[0;32m' &&
YELLOW='\033[0;33m' &&
ORANGE='\033[38;5;208m' &&
NC='\033[0m' && # No Color
failMessage="${RED}FAILED${NC}\n" &&
okMessage="${GREEN}OK${NC}\n" &&


AUX=false

# List of programs to download/install
printf "${RED} Programs to install:"
printf "${RED} #1  git...${NC}\n"
printf "${RED} #2  sublime-text-3...${NC}\n"
printf "${RED} #3  python..${NC}\n"
printf "${RED} #4  terminator...${NC}\n"
printf "${RED} #5  gnome control center...${NC}\n"
printf "${RED} #6  gnome online accounts...${NC}\n"
printf "${RED} #7  adapta-gtk-theme...${NC}\n"
printf "${RED} #8  unity-tweak-tool...${NC}\n"
printf "${RED} #9  search monkey...${NC}\n"
printf "${RED} #10 fritzing...${NC}\n"
printf "${RED} #11 arduino IDE...${NC}\n"
printf "${RED} #12 Waveforms 2015...${NC}\n"
printf "${RED} #13 Adept Runtime...${NC}\n"
printf "${RED} #14 Adept Utilities...${NC}\n"
printf "${ORANGE} #15 Vivado...${NC}\n (manual)"
printf "${RED} #16 Spotify...${NC}\n"
printf "${RED} #17 Shutter...${NC}\n"
printf "${RED} #18 Inkscape...${NC}\n"
printf "${RED} #19 Eagle...${NC}\n"
printf "${RED} #20 cmake...${NC}\n"
printf "${RED} #21 libraries...${NC}\n"
printf "${ORANGE} #22 Chrome...${NC}\n (manual)"


# download items?
printf "${RED}Should I download files? [true/false]${NC}\n" &&
read AUX
if [ "$AUX" = true ]
	then
	NOT_DOWNLOAD=false
else
	NOT_DOWNLOAD=true
fi

# installing git
printf "${YELLOW}installing git...${NC}\n" &&
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} " && (sudo apt-get -qq install git --assume-yes && printf $okMessage) || printf $failMessage

# installing sublime-text-3
printf "${YELLOW}installing sublime text 3...${NC}\n" &&
CHECK=$(ls /etc/apt/sources.list.d | grep webupd8team-ubuntu-sublime-text-3 | head -1)
if [ -z "$CHECK" ]
	then
	sudo add-apt-repository ppa:webupd8team/sublime-text-3
	sudo apt-get update
fi

i=$((i+1)) && printf "${ORANGE}Step $i:${NC} " && (sudo apt-get -qq install sublime-text-installer --assume-yes && printf $okMessage) || printf $failMessage

# install python
printf "${YELLOW}Installing python...${NC}\n" &&
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} " && (sudo apt-get -qq install python-pip --assume-yes && printf $okMessage) || printf $failMessage
printf "\t${ORANGE} matplotlib...${NC}\n" && sudo apt-get -qq install python-matplotlib --assume-yes
printf "\t${ORANGE} numpy...${NC}\n" && sudo apt-get -qq install python-matplotlib --assume-yes


# install terminator
printf "${YELLOW}Installing terminator...${NC}\n" &&
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} " && (sudo apt-get -qq install terminator --assume-yes && printf $okMessage) || printf $failMessage

# install gnome control center
printf "${YELLOW}Installing gnome control center...${NC}\n" &&
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} " && (sudo apt-get -qq install gnome-control-center --assume-yes && printf $okMessage) || printf $failMessage

# install gnome online accounts
printf "${YELLOW}Installing gnome online accounts...${NC}\n" &&
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} " && (sudo apt-get -qq install gnome-online-accounts --assume-yes && printf $okMessage) || printf $failMessage

# install adapta gtk theme
printf "${YELLOW}Installing adapta gtk theme...${NC}\n" &&
CHECK=$(ls /etc/apt/sources.list.d | grep tista-ubuntu-adapta | head -1)
if [ -z "$CHECK" ]
	then
	sudo apt-add-repository ppa:tista/adapta
	sudo apt update
fi
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} " && (sudo apt-get -qq install adapta-gtk-theme --assume-yes && printf $okMessage) || printf $failMessage

# install unity tweak tool
printf "${YELLOW}Installing unity tweak tool...${NC}\n" &&
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} " && (sudo apt-get -qq install unity-tweak-tool --assume-yes && printf $okMessage) || printf $failMessage

# install unity tweak tool
printf "${YELLOW}Installing search monkey...${NC}\n" &&
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} " && (sudo apt-get -qq install searchmonkey --assume-yes && printf $okMessage) || printf $failMessage

# install fritzing
printf "${YELLOW}Installing fritzing...${NC}\n" &&
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} " && (sudo apt-get -qq install fritzing --assume-yes && printf $okMessage) || printf $failMessage


# install arduino
printf "${YELLOW}Installing Arduino IDE...${NC}\n" &&
# printf "\t${YELLOW}downloading...${NC}\n" &&
$NOT_DOWNLOAD || wget "https://downloads.arduino.cc/arduino-1.6.12-linux64.tar.xz" &&
# printf "\t${YELLOW}extracting...${NC}\n" &&
$NOT_DOWNLOAD || tar -xf arduino-1.6.12-linux64.tar.xz &&
# printf "\t${YELLOW}installing...${NC}\n" &&

i=$((i+1)) && printf "${ORANGE}Step $i:${NC} " &&
($NOT_DOWNLOAD && printf $okMessage) || ( (sudo arduino-1.6.12/install.sh && printf $okMessage) || printf $failMessage )
$NOT_DOWNLOAD || sudo rm -r arduino-1.6.12

# installing adept runtime
printf "${YELLOW}Installing Waveforms 2015...${NC}\n" &&
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} $okMessage" &&
$NOT_DOWNLOAD || wget "https://files.digilent.com/Software/Waveforms2015/3.2.5/digilent.waveforms_3.2.5_amd64.deb" -O "$i.deb" &&
# to something with the file
$NOT_DOWNLOAD || rm "$i.deb"

# installing adept runtime
printf "${YELLOW}Installing Adept Runtime...${NC}\n" &&
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} $okMessage" &&
$NOT_DOWNLOAD || wget "https://reference.digilentinc.com/lib/exe/fetch.php?tok=cc2ba2&media=http%3A%2F%2Ffiles.digilent.com%2FSoftware%2FAdept2%2BRuntime%2F2.16.5%2Fdigilent.adept.runtime_2.16.5-amd64.deb" -O "$i.deb" &&
# to something with the file
$NOT_DOWNLOAD || rm "$i.deb"

printf "${YELLOW}Installing Adept Utilities...${NC}\n" &&
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} $okMessage" &&
$NOT_DOWNLOAD || wget "https://reference.digilentinc.com/lib/exe/fetch.php?tok=58577f&media=http%3A%2F%2Ffiles.digilent.com%2FSoftware%2FAdept2%2Fdigilent.adept.utilities_2.2.1-amd64.deb" -O "$i.deb" &&
# to something with the file
$NOT_DOWNLOAD || rm "$i.deb"

# installing spotify
printf "${YELLOW}Installing spotify...${NC}\n" &&
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 &&
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list &&
sudo apt-get update &&
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} " && (sudo apt-get -qq install spotify-client --assume-yes && printf $okMessage) || printf $failMessage

# installing spotify
printf "${YELLOW}Installing shutter...${NC}\n" &&
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} " && (sudo apt-get -qq install shutter --assume-yes && printf $okMessage) || printf $failMessage

# installing inkscape
printf "${YELLOW}Installing shutter...${NC}\n" &&
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} " && (sudo apt-get -qq install inkscape --assume-yes && printf $okMessage) || printf $failMessage

# installing eagle
printf "${YELLOW}Installing shutter...${NC}\n" &&
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} " && (sudo apt-get -qq install eagle --assume-yes && printf $okMessage) || printf $failMessage

# installing cmake
printf "${YELLOW}Installing shutter...${NC}\n" &&
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} " && (sudo apt-get -qq install cmake --assume-yes && printf $okMessage) || printf $failMessage

% installing libraries
printf "${YELLOW}Installing libpng-dev...${NC}\n" &&
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} " && (sudo apt-get -qq install libpng-dev --assume-yes && printf $okMessage) || printf $failMessage
printf "${YELLOW}Installing zlib1g-dev...${NC}\n" &&
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} " && (sudo apt-get -qq install zlib1g-dev	 --assume-yes && printf $okMessage) || printf $failMessage
printf "${YELLOW}Installing giflib-dbg...${NC}\n" &&
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} " && (sudo apt-get -qq install giflib-dbg --assume-yes && printf $okMessage) || printf $failMessage
printf "${YELLOW}Installing libboost-all-dev...${NC}\n" &&
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} " && (sudo apt-get -qq install libboost-all-dev --assume-yes && printf $okMessage) || printf $failMessage


python -m pip install pyserial
apt-get install python-wxgtk3.0
	


printf "${YELLOW}Changing ~/.bashrc...${NC}\n"
BACKGROUND_COLOR="\"'#000046'\""
CHANGE_BG_COLOR_CMD="dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/background-color $BACKGROUND_COLOR"

LAST_LINE=$(tail -1 ~/.bashrc)
if [ "$LAST_LINE" != "$CHANGE_BG_COLOR_CMD" ]
	then

	# sourcing Vivado
	printf "\t${YELLOW}Sourcing Vivado...${NC}\n" &&
	echo "source /opt/Xilinx/Vivado/2016.3/settings64.sh" >> ~/.bashrc

	# configure gnome-terminal appearance
	printf "\t${YELLOW}Configuring gnome-terminal...${NC}\n"
	echo "export PS1=\"\[\$(tput bold)\]\[\033[38;5;184m\]\u\[\$(tput sgr0)\]\[\033[38;5;39m\]@\[\$(tput sgr0)\]\[\033[38;5;34m\]\h\[\$(tput sgr0)\]\[\$(tput sgr0)\]\[\033[38;5;15m\]:\[\$(tput bold)\]\w\[\$(tput sgr0)\] \\\\$\[\$(tput sgr0)\]"\" >> ~/.bashrc
	echo $CHANGE_BG_COLOR_CMD >> ~/.bashrc
fi
i=$((i+1)) && printf "${ORANGE}Step $i:${NC} $okMessage" 

