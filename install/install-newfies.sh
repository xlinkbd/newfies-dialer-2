#!/bin/bash
#
# Newfies-Dialer License
# http://www.newfies-dialer.org
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this file,
# You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (C) 2011-2015 Star2Billing S.L.
#
# The primary maintainer of this project is
# Arezqui Belaid <info@star2billing.com>
#

#
# To download and run the script on your server :
#
# >> Install with Master script :
# cd /usr/src/ ; rm install-newfies.sh ; wget --no-check-certificate https://raw.github.com/newfies-dialer/newfies-dialer/master/install/install-newfies.sh ; chmod +x install-newfies.sh ; ./install-newfies.sh
#
# >> Install with develop script :
# cd /usr/src/ ; rm install-newfies.sh ; wget --no-check-certificate https://raw.github.com/newfies-dialer/newfies-dialer/develop/install/install-newfies.sh ; chmod +x install-newfies.sh ; ./install-newfies.sh
#

# Set branch to install develop / default: master
if [ -z "${BRANCH}" ]; then
    BRANCH='master'
fi

#Get Scripts dependencies
cd /usr/src/
rm newfies-dialer-functions.sh
wget --no-check-certificate https://github.com/wlvoipin/newfies-dialer/tree/$BRANCH/install/newfies-dialer-functions.sh -O newfies-dialer-functions.sh
#Include cdr-stats install functions
source newfies-dialer-functions.sh


#Menu Section for Script
show_menu_newfies() {
    clear
    echo " > Newfies-Dialer Installation Menu"
    echo "====================================="
    echo "  1)  Install All"
    echo "  2)  Install Newfies-Dialer Web Frontend"
    echo "  3)  Install Newfies-Dialer Backend / Celery"
    echo "  0)  Quit"
    echo -n "(0-3) : "
    read OPTION < /dev/tty
}


# * * * * * * * * * * * * Start Script * * * * * * * * * * * *

#Identify the OS
func_identify_os

#Request the user to accept the license
func_accept_license

echo "========================================================================="
echo ""
echo "Newfies-Dialer installation will start now!"
echo ""
echo "Press Enter to continue or CTRL-C to exit"
echo ""
read INPUT

func_install_frontend
func_install_landing_page
func_install_backend

# ExitFinish=0

# while [ $ExitFinish -eq 0 ]; do

#     # Show menu with Installation items
#     show_menu_newfies
#     case $OPTION in
#         1)
#             func_install_frontend
#             func_install_landing_page
#             func_install_backend
#             echo done
#         ;;
#         2)
#             func_install_frontend
#             func_install_landing_page
#         ;;
#         3)
#             func_install_backend
#         ;;
#         0)
#         ExitFinish=1
#         ;;
#         *)
#     esac
# done


# Clean the system
#=================
# deactivate ; rm -rf /usr/share/newfies ; rm -rf /var/log/newfies ; rmvirtualenv newfies-dialer ; rm -rf /etc/init.d/newfies-celer* ; rm -rf /etc/default/newfies-celeryd ; rm /etc/apache2/sites-enabled/newfies.conf
