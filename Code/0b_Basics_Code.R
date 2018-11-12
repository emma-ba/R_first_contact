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

###### Converting Text <-> Number
d <- as.character(100)
print(d)

d <- '200'
d <- d/2
d <- as.numeric(d)
print(d)

d <- 'Hello'
d <- as.numeric(d)
print(d)

###### Boolean
d <- TRUE
print(d)

as.numeric(d)
as.character(d)

as.logical('TRUE')
as.logical(1)

if( d ){
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

###### Chek the data type
typeof(d)

###########################

###########################
### ADVANCED DATA TYPES
###########################

###### Vector
d <- c(1:100)
print(d)
typeof(d)

d <- d/10
print(d)

d <- c('Apple', 'Carrot', 'Orange')
print(d)
typeof(d)

d <- paste(d, 'Juice')
print(d)

###### Dataframe
user1 <- c('Anthony', 'Red', 'Apple', 'Dog')
user2 <- c('Barbara', 'Blue', 'Carrot', 'Cat')
user3 <- c('Charlotte' ,'Black', 'Orange', 'Pig')

# Bind as rows
d <- rbind(user1, user2, user3)
print(d)

colnames(d) <- c('Name', 'Color', 'Food', 'Animal')
print(d)

# Bind as columns
d <- cbind(user1, user2, user3)
print(d)

rownames(d) <- c('Name', 'Color', 'Food', 'Animal')
print(d)

# Reverse
d <- t(d)
print(d)

# Add row
user4 <- c('Daniel' ,'Orange', 'Pear', 'Cat')
d <- rbind(d,user4)
print(d)

# Add column
ID <- c(1:4) 
d <- cbind(ID,d)
print(d)

# Browse data
d[1,]
d[,1]
d[1,1]
d[2:3,]

print(d$Name)
d <- data.frame(d)
print(d$Name)
print(d$Name[2])

# Data types in data frames
typeof(d$ID)
d$ID <- as.numeric(d$ID)

d$Age <- c(11,14,21,34)
print(d)
typeof(d$Age)

# Filters to browse table
d$Age >= 18
d[d$Age >= 18, ]

d$Age[d$Age >= 18]

###### List (container)
d <- list(d)
print(d)
print(d[[1]])

d[[2]] <- 'Metadata: This is a sample of user preference.'
print(d)

d[[3]] <- 1:4
print(d)

# Manipulate lists
d <- rev(d)
print(d)

print(d[[1]][,2])
rownames(d[[1]]) <- c()
print(d[[1]][,2])

d[[1]] <- rev(d[[1]])
print(d)

###########################


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

