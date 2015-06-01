#!/bin/bash

# --------------------------------------------------------------
# Author: Alexander Snyder
# Email: info@ThisGuyShouldWorkFor.Us
# Copyright (C) 2015 Alexander Snyder
# 
# Description: Scan mail logs, count outgoing messages for that day
#
# Licensing: 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Repository: 
# https://github.com/misteralexander/bash
#
# Dependency: 
# --------------------------------------------------------------

# Find out what the MTA is
mta=$(egrep -wi 'exim|qmail|postfix' /etc/init.d/*)

if [[ $mta -eq exim ]]
	then
		mta-count=$(egrep -i '<=' /var/log/exim_mainlog | egrep -vi 'failed|failure' | cut -d'@' -f2 | awk '{print $1}' | sort | uniq -c | sort -nr | head)
elif [[ $mta -eq qmail ]]
	then
		mta-count=$(parse mail log for outgoing messages, count them)
elif [[ $mta -eq postfix ]]
	then
		mta-count=$(parse mail log for outgoing messages, count them)
else
	mta-count=$(egrep -i '$(date +"%b %d")|stat=Sent' /var/log/maillog | wc -l)
	echo "We didn't find Exim, Qmail, or Postfix, but \"/var/log/maillog\" has counted $mta-count today"
fi

date +%Y-%m-%d