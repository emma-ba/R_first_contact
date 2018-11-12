
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

###### Loop
participants <- c('Anthony', 'Barbara', 'Charlotte', 'Daniel')

for(p in participants){
  print(p)
}

for(i in 1:10){
  print(2*i)
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