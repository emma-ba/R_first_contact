# data_backup <- data_cbs
# data_cbs <- data_backup

###########################
### TIBBLE
###########################
# data_cbs <- read.csv('../Data/CBS_Formatted.csv')
data_cbs <- data_cbs %>% as_tibble()
data_cbs

###########################

###########################
### FILTER
###########################

data_cbs %>% 
  filter(Periods == 2015)

# activity <- data_cbs$Activities %>% unique
data_cbs %>% 
  filter(Activities == activity[7])

data_cbs %>% 
  filter(Periods > 2001)

###########################

###########################
### SELECT
###########################

data_cbs %>% 
  select(Labour)

data_cbs %>% 
  filter(Periods == 2001) %>% 
  select(Labour)

# data_cbs %>% 
#   select(Labour) %>% 
#   filter(Periods == 2001)

###########################

###########################
### ADD DATA
###########################

# Make Shorter Labels
data_cbs
data_cbs <- data_cbs %>% 
  mutate(Label = Activities %>% substr(1,5) )

###########################

###########################
### MODIFY DATA
###########################

data_cbs$Label <- substr(data_cbs$Activities, 1, 20) 
data_cbs$Label %>% unique()

data_cbs <- data_cbs %>% 
  mutate(Label = Activities %>% substr(1,20) )

data_cbs$Label <- paste(data_cbs$Label, '[...]')

###########################

###########################
### SORT DATA
###########################

data_cbs %>% 
  arrange(Periods)

data_cbs %>% 
  arrange( desc(Periods) )

data_cbs %>% 
  arrange(Activities, Periods)

head(data_cbs)
tail(data_cbs)
data_cbs <- data_cbs %>% 
  arrange(Activities, Periods)

##########################

###########################
### PARSE DATA WITH LOOP 
###########################

### The 'For' Loop
for(act in unique(data_cbs$Activities)){
  print(act)
}

for(y in data_cbs$Periods){
  print(y)
}

for(i in 1:10){
  print(i)
}

for(i in 1:nrow(data_cbs)){
  print(data_cbs$Activities[i])
}


### Application
Labour_Growth <- Output_Growth <- ValueAdded_Growth <- c()

for(i in 1:nrow(data_cbs)){
  
  # For Year 2001: No Rate (no data for year 2000)
  if( data_cbs$Periods[i] == 2001 ) {
    Labour_Growth[i] <- Output_Growth[i] <- ValueAdded_Growth[i] <- NA
  } else {
    Labour_Growth[i] <- data_cbs$Labour[i]/data_cbs$Labour[i-1]
    Output_Growth[i] <- data_cbs$Output[i]/data_cbs$Output[i-1]
    ValueAdded_Growth[i] <- data_cbs$ValueAdded[i]/data_cbs$ValueAdded[i-1]
  }
  
}

data_cbs <- data_cbs %>% 
  mutate(Labour_Growth=Labour_Growth, 
        Output_Growth=Output_Growth, 
        ValueAdded_Growth=ValueAdded_Growth)

###########################

###########################
### VISUALIZATION - Step 2
###########################

data_cbs %>% 
  filter(!is.na(Labour_Growth)) %>%
  ggplot(aes(Periods, Labour_Growth, col=Label)) + 
  # ggplot(aes(Periods, Labour_Growth, col=Label)) + 
  facet_wrap( ~ Label, ncol=3) +
  geom_point() + geom_line()  +
  ggtitle('Labour_Growth')

data_cbs %>% 
  filter(!is.na(Output_Growth)) %>%
  ggplot(aes(Periods, Output_Growth, col=Label)) + 
  geom_point() + geom_line()  +
  ggtitle('Output_Growth')

data_cbs %>% 
  filter(!is.na(ValueAdded_Growth)) %>%
  ggplot(aes(Periods, ValueAdded_Growth, col=Label)) + 
  geom_point() + geom_line()  +
  ggtitle('ValueAdded_Growth')

###########################

###########################
### VISUALIZATION - Step 3
###########################

data_cbs %>% 
  filter(Periods > 2001) %>%
  ggplot(aes(Periods, Labour_Growth, col=Label, group=1)) + 
  facet_wrap( ~ Label, ncol=3) +
  geom_point() + geom_line() 

data_cbs %>% 
  filter(Periods > 2001) %>%
  ggplot(aes(Periods, Output_Growth, group=1)) + 
  facet_wrap( ~ Label, ncol=3) +
  geom_point() + geom_line() 

data_cbs %>% 
  filter(Periods > 2001) %>%
  ggplot(aes(Periods, ValueAdded_Growth, group=1)) + 
  facet_wrap( ~ Label, ncol=3) +
  geom_point() + geom_line() 


###########################
