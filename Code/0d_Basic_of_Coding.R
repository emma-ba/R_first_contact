###########################
### BASICS OF CODING
###########################

###### IF - THEN - ELSE
credit <- 10

if( credit <= 0 ){
  print('Your have no credit!')
} else if( credit < 5 ) {
  print('Your credit is insufficient...')
} else {
  print('You have enough credit')
}

###### Boolean
d <- TRUE
print(d)
print(!d)

as.numeric(d)
as.character(d)

as.logical('TRUE')
as.logical(0)

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
# age <- 17
# age <- 72
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


###### Loop
participants <- c('Anthony', 'Barbara', 'Charlotte', 'Daniel')

for(p in participants){
  print(p)
}

for(i in 1:10){
  print(i)
}
print(i)

# Loop to browse tables
d <- d[[3]]
colnames(d) <- c()

for(i in 1:nrow(d) ){
  print(d[i,])
}

for(i in 1:nrow(d) ){
  if(d$Age[i] >= 18){
    print(d$Name[i])
  }
}

adults <- c()
for(i in 1:nrow(d) ){
  if(d$Age[i] >= 18){
    adults <- c(adults, d$Name[i])
  }
}
print(adults)
length(adults)

adults <- d$Name[d$Age >= 18]
print(adults)

###### Functions
is_adult <- function(age){
  if(age >= 18){
    return(TRUE)
  } else {
    return(FALSE)
  }
}

is_adult(3)

for(i in 1:nrow(d) ){
  if( is_adult(d$Age[i]) ){
    print( d$Name[i] ) 
  }
}

###########################