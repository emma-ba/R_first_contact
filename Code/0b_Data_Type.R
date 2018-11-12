###########################
### BASIC DATA TYPES
###########################

###### Numbers
d <- 1
print(d)

d <- 2 * d
print(d)

d <- d / 10
print(d)

###### Text
d <- 'Hello'
print(d)

d <- paste(d, 'World')

###### Converting Text <-> Number
# Check the type of data
typeof(d)

d <- 100
d <- as.character(d)
print(d)
d <- as.numeric(d)
print(d)

d <- '200'
d <- d/2
d <- as.numeric(d)
d <- d/2
print(d)

d <- 'Hello'
d <- as.numeric(d)


###### Boolean
d <- TRUE
print(d)

as.numeric(d)
as.character(d)

as.logical('TRUE')
as.logical(1)

###### Use of booleans for tests
d <- 100
d == 100
d == 200
d = 200
print(d)
d > 10
d < 100


if( d > 0 ){
  print('The test was passed!')
} 

d <- FALSE

if( d ){
  print('The test was passed!')
} else {
  print('The test has failed...')
}

if( !d ){
  print('The test was passed!')
} 

############ EXERCIZE #####
# 
# Given someone's age, for example:
age <- 17
age <- 72
# Make a test (with if-then-else) that tells you when someone is minor 
# (less than 18 year old)
#
# SOLUTION:
# if( age < 18) {
#   print("This person is minor.")
# } else {
#   print("This person is adult.")
# }
#
###########################

