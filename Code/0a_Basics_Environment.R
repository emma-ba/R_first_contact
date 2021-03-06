###########################
### WORKING DIRECTORY
###########################
# In R-studio menu: Session -> Set Working Directory -> To Source File Location

setwd(dirname(rstudioapi::getSourceEditorContext()$path))

###########################

###########################
### LIBRARIES (also called packages)
###########################
### TIDYVERSE 
# This library includes other libraries:
# stringr, ggplot2, dplyr, ...
# Check https://tidyverse.org/

###### Install a library
install.packages('tidyverse')

# Once a library is installed on your computer,
# you don't need to install it every time your execute R code.

# First check if a library is installed, or else we will re-installing it
if(!require('tidyverse')) install.packages('tidyverse')
if(!require('stringr')) install.packages('stringr')

###### Load a library
library(tidyverse) 
library(stringr) 

# You need to load it every time you execute R code.

############ EXERCIZE #####
# 
# Install and load a libary for reading the content of web pages 
# Hint: the format of webpages is called "html" (a special version of "xml")
# (like the format of images can be "png", "jpeg" or "gif")
#
# SOLUTION:
# if(!require('rvest')) install.packages('rvest')
# library(tidyverse) 
#
# Full list of all libraries:
# https://cran.r-project.org/web/packages/available_packages_by_name.html
#
###########################

###########################
### GENERAL OPTIONS
###########################

# This one controls how numbers are displayed
options(scipen = 999)

print(1/10^10)
options(scipen = 1)
print(1/10^10)

options(scipen = 999)

# This one controls the encoding of dataframes
options(stringsAsFactors = FALSE)

###########################

###########################
### SHORTCUTS
###########################

# <-  Option + Character "-"
# #   Cmd + Maj + C

###########################
