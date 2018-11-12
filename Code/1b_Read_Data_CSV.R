###########################
### CSV
###########################

##### Example
csv_test <- 'col1, col2, col3\n 1, 2, 3\n 11, 22, 33\n 111, 222, 333'
print(csv_test)

write(csv_test, 'csv_test.csv')
read.csv('csv_test.csv')

##### CBS Data
# Source: https://opendata.cbs.nl/statline/#/CBS/en/dataset/83154ENG/table?ts=1540196011636
# + Manually reset the filters to select all year

# Read downloaded csv file 
data_cbs <- read.csv('../Data/CBS_Environmental_sector__activities.csv')
head(data_cbs)

# Using ';' as separator instead of ','
data_cbs <- read.csv('../Data/CBS_Environmental_sector__activities.csv', sep=';')
head(data_cbs)

###########################

###########################
### BRIEF OVERVIEW
###########################

head(data_cbs)
tail(data_cbs)
glimpse(data_cbs)

###########################

###########################
### PIPE %>%
###########################
# library(stringr) # Included in tidyverse

head(data_cbs)
data_cbs %>% head 

###########################

###########################
### PREPARE DATA
###########################

# Shorter column names
colnames(data_cbs) <- c('Header','Activities','Periods','Labour','Output','ValueAdded')
head(data_cbs)

# Format Year
data_cbs$Periods <- gsub('\\*','', data_cbs$Periods)
data_cbs$Periods <- as.numeric(data_cbs$Periods)

# Format Labour
data_cbs$Labour <- gsub(',','.', data_cbs$Labour)
data_cbs$Labour <- as.numeric(data_cbs$Labour)

# Save Data
write.csv(data_cbs, '../Data/CBS_Formatted.csv')

###########################

###########################
### VISUALIZATION
###########################

########### Labour ###########
#### All-in-One
data_cbs %>% 
  ggplot(aes(Periods, Labour, col=Activities)) + 
  geom_point() + geom_line()  +
  ggtitle('Labour')

# Separate in panels
data_cbs %>% 
  ggplot(aes(Periods, Labour, col=Activities)) + 
  facet_wrap( ~ Activities, ncol=3) +
  geom_point() + geom_line()  +
  ggtitle('Labour')

# Use different scales for the y-axis
data_cbs %>% 
  ggplot(aes(Periods, Labour, col=Activities)) + 
  facet_wrap( ~ Activities, ncol=3, scales='free') +
  geom_point() + geom_line()  +
  ggtitle('Labour')

###### Without Total
# All-in-One
data_cbs[data_cbs$Activities != 'Total sector environment',] %>% 
  ggplot(aes(Periods, Labour, col=Activities)) + 
  geom_point() + geom_line()  +
  ggtitle('Labour')

# Separate in panels
data_cbs[data_cbs$Activities != 'Total sector environment',] %>% 
  ggplot(aes(Periods, Labour, col=Activities)) + 
  facet_wrap( ~ Activities, ncol=3) +
  geom_point() + geom_line()  +
  ggtitle('Labour')

# Use different scales for the y-axis
data_cbs[data_cbs$Activities != 'Total sector environment',] %>% 
  ggplot(aes(Periods, Labour, col=Activities)) + 
  facet_wrap( ~ Activities, ncol=3, scales='free') +
  geom_point() + geom_line()  +
  ggtitle('Labour')


########### Output ########### 
#### All-in-One
data_cbs %>% 
  ggplot(aes(Periods, Output, col=Activities)) + 
  geom_point() + geom_line()  +
  ggtitle('Output')

# Separate in panels
data_cbs %>% 
  ggplot(aes(Periods, Output, col=Activities)) + 
  facet_wrap( ~ Activities, ncol=3) +
  geom_point() + geom_line()  +
  ggtitle('Output')

# Use different scales for the y-axis
data_cbs %>% 
  ggplot(aes(Periods, Output, col=Activities)) + 
  facet_wrap( ~ Activities, ncol=3, scales='free') +
  geom_point() + geom_line()  +
  ggtitle('Output')

###### Without Total
# All-in-One
data_cbs[data_cbs$Activities != 'Total sector environment',] %>% 
  ggplot(aes(Periods, Output, col=Activities)) + 
  geom_point() + geom_line()  +
  ggtitle('Output')

# Separate in panels
data_cbs[data_cbs$Activities != 'Total sector environment',] %>% 
  ggplot(aes(Periods, Output, col=Activities)) + 
  facet_wrap( ~ Activities, ncol=3) +
  geom_point() + geom_line()  +
  ggtitle('Output')

# Use different scales for the y-axis
data_cbs[data_cbs$Activities != 'Total sector environment',] %>% 
  ggplot(aes(Periods, Output, col=Activities)) + 
  facet_wrap( ~ Activities, ncol=3, scales='free') +
  geom_point() + geom_line()  +
  ggtitle('Output')


########### ValueAdded ########### 
#### All-in-One
data_cbs %>% 
  ggplot(aes(Periods, ValueAdded, col=Activities)) + 
  geom_point() + geom_line()  +
  ggtitle('ValueAdded')

# Separate in panels
data_cbs %>% 
  ggplot(aes(Periods, ValueAdded, col=Activities)) + 
  facet_wrap( ~ Activities, ncol=3) +
  geom_point() + geom_line()  +
  ggtitle('ValueAdded')

# Use different scales for the y-axis
data_cbs %>% 
  ggplot(aes(Periods, ValueAdded, col=Activities)) + 
  facet_wrap( ~ Activities, ncol=3, scales='free') +
  geom_point() + geom_line()  +
  ggtitle('ValueAdded')

###### Without Total
# All-in-One
data_cbs[data_cbs$Activities != 'Total sector environment',] %>% 
  ggplot(aes(Periods, ValueAdded, col=Activities)) + 
  geom_point() + geom_line()  +
  ggtitle('ValueAdded')

# Separate in panels
data_cbs[data_cbs$Activities != 'Total sector environment',] %>% 
  ggplot(aes(Periods, ValueAdded, col=Activities)) + 
  facet_wrap( ~ Activities, ncol=3) +
  geom_point() + geom_line()  +
  ggtitle('ValueAdded')

# Use different scales for the y-axis
data_cbs[data_cbs$Activities != 'Total sector environment',] %>% 
  ggplot(aes(Periods, ValueAdded, col=Activities)) + 
  facet_wrap( ~ Activities, ncol=3, scales='free') +
  geom_point() + geom_line()  +
  ggtitle('ValueAdded')

###########################

###########################
### SAVE VISUALIZATION
###########################
# http://www.cookbook-r.com/Graphs/Output_to_a_file/

pdf('../Viz/CBS_Labour_Overview.pdf')
data_cbs %>% 
  ggplot(aes(Periods, Labour, col=Activities)) + 
  facet_wrap( ~ Activities, ncol=3, scales='free') +
  geom_point() + geom_line()  +
  ggtitle('Labour')
dev.off()


png('../Viz/CBS_Labour_Overview.png')
data_cbs %>% 
  ggplot(aes(Periods, Labour, col=Activities)) + 
  facet_wrap( ~ Activities, ncol=3, scales='free') +
  geom_point() + geom_line()  +
  ggtitle('Labour')
dev.off()

###########################
