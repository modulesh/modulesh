#!/bin/bash

#    modules at any shell modules for bash script language - more than a snake
#    Copyright (C) 2021  lazypwny
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>

case ${1} in
    [hH][eE][lL][pP]|--[hH][eE][lL][pP]|-[hH])
        printf "sudo bash ./installer.sh --install: This argument is used to install modulesh on your system.\nsudo bash ./install.sh --reinstall: This argument deletes the module if it is installed, then installs it again. If it breaks modulesh, you can install it again with this option.\nsudo bash ./installer.sh --uninstall: This argument is used to remove the installed modulesh from your system.\n"
        exit 0
    ;;
esac

[ $UID != 0 ] && { printf "this script need to be root privalages pls try with 'sudo bash $0 --<argument>'\n" ; exit 1 ;}

moduledir="/usr/local/lib/modulesh"

user=${SUDO_USER:-$USER}:${SUDO_USER:-$USER}

getsubsystem() {
    echo "getting subsystem.."
    [ ! -d ${moduledir} ] && mkdir /usr/local/lib/modulesh
    [ ! -d /usr/share/modulesh ] && mkdir /usr/share/modulesh 
    chown ${user} /usr/local/lib/modulesh
    chown ${user} /usr/share/modulesh
}

copytriggers() {
    echo "copy triggers (1/2)"
    [ ! -e /usr/bin/modulesh ] && cp ./usr/bin/modulesh /usr/bin
    chown ${user} /usr/bin/modulesh
    chmod 755 /usr/bin/modulesh
    echo "copy triggers (2/2)"
    [ ! -e /usr/bin/getmodulesh ] && cp ./usr/bin/getmodulesh /usr/bin
    chown ${user} /usr/bin/getmodulesh
    chmod 755 /usr/bin/getmodulesh
}

copymodules() {
    echo "copy $(ls ./usr/local/lib/modulesh/*.sh | wc -l) modules."
    cp ./usr/local/lib/modulesh/* ${moduledir}
    chown ${user} ${moduledir}/*
    chmod 755 ${moduledir}/*                                         
}

copymanuals() {
    echo "getting manual dir.."
    [ ! -d /usr/share/modulesh/info ] && mkdir /usr/share/modulesh/info
    chown ${user} /usr/share/modulesh/info
    echo "copy $(ls ./usr/share/modulesh/info/*.info | wc -l) manual pages"
    cp ./usr/share/modulesh/info/*.info /usr/share/modulesh/info
    chown ${user} /usr/share/modulesh/info/*.info
}

case ${1} in
    [iI][nN][sS][tT][aA][lL][lL]|--[iI][nN][sS][tT][aA][lL][lL]|-[iI])
        getsubsystem
        copytriggers
        copymodules
        copymanuals
        echo "instalation complated pls check to type 'modulesh -v'"
        exit 0
    ;;
    [rR][eE][iI][nN][sS][tT][aA][lL][lL]|--[rR][eE][iI][nN][sS][tT][aA][lL][lL]|-[rR])
        echo "removing exist module dir.."
        [ -d ${moduledir} ] && rm -rf ${moduledir}
        echo "removing exist tools dir"
        [ -d /usr/share/modulesh ] && rm -rf /usr/share/modulesh 
        echo "removing triggers (1/2)"
        [ -e /usr/bin/modulesh ] && rm /usr/bin/modulesh 
        echo "removing triggers (2/2)"
        [ -e /usr/bin/getmodulesh ] && rm /usr/bin/getmodulesh 
        getsubsystem
        copytriggers
        copymodules
        copymanuals
        exit 0   
    ;;
    [uU][nN][iI][nN][sS][tT][aA][lL][lL]|--[uU][nN][iI][nN][sS][tT][aA][lL][lL]|-[uU])
        echo "removing exist module dir.."
        [ -d ${moduledir} ] && rm -rf ${moduledir}
        echo "removing exist tools dir"
        [ -d /usr/share/modulesh ] && rm -rf /usr/share/modulesh
        echo "removing triggers (1/2)"
        [ -e /usr/bin/modulesh ] && rm /usr/bin/modulesh 
        echo "removing triggers (2/2)"
        [ -e /usr/bin/getmodulesh ] && rm /usr/bin/getmodulesh
        exit 0
    ;;
    *)
        printf "wrong usage pls type 'sudo bash ./installer.sh --help'\n"
        exit 1
    ;;
esac

# (23:115) Did you imagine that We created you without any purpose, and that you will not be brought back to Us?"
# (Mü'minun suresi:115) Yoksa sizi ancak boşu boşuna yarattık gerçekten de dönüp tapımıza gelmeyeceksiniz mi sanıyordunuz?