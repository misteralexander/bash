<?php

# --------------------------------------------------------------
# Author: Alexander Snyder
# Email: info@ThisGuyShouldWorkFor.Us
# Copyright (C) 2015 Alexander Snyder
# 
# Description: 
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

// Create connection

// GRANT ALL PRIVILEGES ON cphulkd.* TO brutescopy@'localhost' IDENTIFIED BY 'j3PZ89!fcAk2tM5mwD';

$con = mysqli_connect("localhost","brutescopy","j3PZ89!fcAk2tM5mwD","cphulkd");

// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

$moveip = ("INSERT INTO blacklist (IP) SELECT IP FROM brutes"); //move the IPs from the 'brutes' table onto the 'blacklist'
$empty = ("TRUNCATE TABLE brutes"); //empty the brutes table

mysqli_query($con, $moveip); // do it...
mysqli_query($con, $empty); // get to da choppah!

mysqli_close($con); // goooooo!

?>
