# course project: getting and cleaning data

# 1. clean up,load requirements, set working directory
rm(list=ls())   
require(dplyr)
require(stringr)
require(tidyr)

setwd("C:/Users/Speko2/Documents/Hopkins/cleaning/UCI HAR Dataset/")

# 2. load activity labels, feature name
activity_labels <-read.table('activity_labels.txt')
features<- read.table('features.txt')
  
# 3. load test data
test_data_x <- read.table('test/X_test.txt')
test_data_y <- read.table('test/y_test.txt')
test_subjects <- read.table('test/subject_test.txt')

test_data <- cbind(test_subjects,test_data_y, test_data_x)

# 4.load train data
train_data_x <- read.table('train/X_train.txt')
train_data_y <- read.table('train/y_train.txt')
train_subjects <- read.table('train/subject_train.txt')

train_data <- cbind(train_subjects,train_data_y, train_data_x)

# 5. merge test & train data
all_data <- rbind(train_data, test_data)

# 6. select variables  with 'mean()' or 'std()'
var_idx <- features[grep('mean\\(\\)|std\\(\\)', features$V2),]

# subset with found indeces
all_data_mean_std <- all_data[,c(1,2,(2+var_idx$V1))]

# 7. format the feature names (remove paranthesis + hyphen to underscore)
feature_names <- str_replace(string = var_idx$V2 ,pattern = '\\(\\)',replacement =  '')
feature_names <- as.character(str_replace_all(feature_names,pattern = '-',replacement =  '_'))

# names the columns
names(all_data_mean_std)<-c('subject', 'activity', feature_names)

# 8. name Activities
all_data_mean_std$activity <- as.character(factor(all_data_mean_std$activity, levels = activity_labels$V1, labels = activity_labels$V2))
all_data_mean_std <- arrange(all_data_mean_std,subject, activity)

# 9. create tidy data set using tidyr+dplyr (to reshape and aggregate)
tidy <- gather(all_data_mean_std, subject, activity)
names(tidy) <- c('subject','activity','feature','measure')
tidy_set <- group_by(tidy, subject,activity, feature) %>%
  summarise(calculated_mean = mean(measure))

# save tidy data set 
write.table(x = tidy_set, file = '../tidy_set.txt',row.names =FALSE)

