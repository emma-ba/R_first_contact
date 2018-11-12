###########################
### WORKING DIRECTORY
###########################
# In R-studio menu: Session -> Set Working Directory -> To Source File Location

setwd(dirname(rstudioapi::getSourceEditorContext()$path))

###########################

###########################
### LIBRARIES
###########################

###### Install a library
install.packages('tidyverse')

# First check if a library is installed
if(!require('tidyverse')) install.packages('tidyverse')

# Once a library is installed on your computer,
# you don't need to install it every time your execute R code.
# But you need to load it every time.

###### Load a library
library(tidyverse) 

# This library includes other libraries:
# stringr, ggplot2, dplyr, ...
# Check https://tidyverse.org/

###### Other libraries we'll use
if(!require('data.table')) install.packages("data.table", type = "source",
                                            repos = "https://Rdatatable.github.io/data.table")
if(!require('xml2')) install.packages('xml2')

library(tidyverse) 
library(data.table)
library(readxl) 
library(xml2)

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
