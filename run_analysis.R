####

####

# Getting and cleaning data
# Course project

library(dplyr)
library(tidyr)
library(reshape)

setwd("C:/Users/med-jep/Dropbox/Learning statistics in R/getting data/gcd_project")
setwd("datasets")

# Download files from:
urldata <-  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# Description of data here:
urldesc <- "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones" 

# The following code assumes that your working directory is the
# folder containing this list of files and folders:
# [1] "activity_labels.txt" "features.txt"        "features_info.txt"  
# [4] "README.txt"          "test"                "train"

# check if you are in the right directory:
dir()
list.files()

# Reads the labels and their respective number 
label_list <- read.table("activity_labels.txt")

# Read varnames (called features in documentation)
varnames <- read.table("features.txt")
# Removes unnecessary first column with rownumber
varnames <- varnames[,2]


### Reads the test folder ###

# Reads the test-data set into R
testx <- read.table("test/X_test.txt")

# Reads the label number (activity type) for test group
label_test <- read.table("test/y_test.txt")

# Reads the subject number for test group
subjtest <- read.table("test/subject_test.txt")



### Reads the train folder ###

# Reads the train data set into R
trainx <- read.table("train/X_train.txt")

# Reads the subject numbers for train group
subjtrain <- read.table("train/subject_train.txt")

# Reads the activity type for train
label_train <- read.table("train/y_train.txt")

### All data read into memory


# Attach the vector of /varnamesfeatures as column-names
# on the data and name the subject and activity vectors

# removes hyphen from varnames
varnames2 <- make.names(varnames, unique = TRUE)
head(varnames2)

# names the variables in train and test
colnames(testx) <- varnames2
colnames(trainx) <- varnames2
length(testx[1,])  # Just check the number of columns

# rename variables for the activity and subject vectors
subjtest <- rename(subjtest, subject = V1)
subjtrain <- rename(subjtrain, subject = V1)
label_test <- rename(label_test, activity = V1)
label_train <- rename(label_train, activity = V1)

# All variables and vectors now have proper names
# Still data is separated in six dataframes

# Puts together data with activity and subjects
# still train and test separated
testmain <- cbind(testx, label_test, subjtest)
trainmain <- cbind(trainx, label_train, subjtrain)

# just to check that subject and activity has been attached properly
View(testmain[, 560:563])
View(trainmain[, 560:563])

# combines the train and test datasets into one
dataraw <- rbind(testmain, trainmain)

### We now have the entire dataset in dataraw


### Time to select the variables we want

# select only activity, subject, and variables 
# with mean and std in their name
sdata <- select(dataraw, contains("mean"), contains("std"), activity, subject)

# label the activities
sdata$activity <- factor(sdata$activity,
                         levels = label_list$V1,
                         labels = label_list$V2)

View(sdata)

# Step 5 creates new dataset, first group on subject
# then group activity within the subject

gdata <- group_by(sdata, subject, activity)

# Creates the mean for all subjects six different activities.
?summarise_each
meandata <- summarise_each(gdata, funs(mean))

# 30 subjects * 6 activities = 180 rows
# 88 columns containing 2 variables indicating subject and activity
# and 86 variables from the registration, now an average of the 
# mean and standard deviations registered.

# This is the tidy dataset written to a .txt-file
# You'll find it in your working directory :-)
View(meandata)
write.table(meandata, file = "tidyset.txt", row.names = FALSE)
list.files()

####
# Code to get the variable names for the codebook
varlist <- names(meandata)
varlist
write.table(names(meandata))
