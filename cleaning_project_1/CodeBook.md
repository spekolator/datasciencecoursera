Getting and Cleaning Data Course Project CodeBook
=================================================
This file describes the variables, the data, and the transformations that was performed to clean up the data
* The raw data was obtained:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
* The run_analysis.R script cleans the data in the following way:

1. clean up global enviroment,load required libs, set working directory
2. load activity labels, feature name, store them as *activity_labels* and *features*
3. load test data (*X_test.txt*,*y_test.txt*,*subject_test.txt*) and uses cbind to make a combined dataframe named *test_data*
4. load train data (*X_train.txt*,*y_train.txt*,*subject_train.txt*) and uses cbind to make a combined dataframe named *train_data*
5. merge test & train, using rbind to *all_data*
6. select variables  with 'mean()' or 'std()' from *features* using grep matching 'std()' or 'mean()'. This gives 2 x 33 features
7. format the feature names (remove paranthesis + hyphen to underscore), 
8. name activities, using the factor function to match the *activity_labels* to the numbers in the *all_data*
9. create tidy data set using tidyr+dplyr (to reshape and aggregate). Gather melts the dataframe so it is easy to aggregate with *summary* function. This results in a 4 x 679734 data frame with *subject*,*activity*,*feature*, *calculated mean*.
10. save tidy dataset
