Getting and Cleaning Data Course Project README
=================================================
This file what you should do, to get my *run_analysis.R* script to run

1.download the data from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
2. unzip the data to the directory where *run_analysis.R* is located (keeping the folder structure)
3. open the *run_analysis.R* and change the setwd to where you have located the script, and save the file
4. source("run_analysis.R")
5. this creates a file *tidy_set.txt* in the current working directory with the aggreagated means.

If you would like to read the tidy file back into R type *read.table(tidy_set.txt)* 