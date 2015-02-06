---
title: "Codebook for course project in Getting and cleaning data"
author: "Jesper Petersen"
date: "Friday, February 06, 2015"
output: html_document
---

## Course Getting and cleaning data
See general course description [here](https://www.coursera.org/course/getdata)

This is the codebook for the data set derived from *Human Activity Recognition Using Smartphones Data Set*. For full documentation of the original dataset please see the UCI Machine learning repository's [storage of the data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Full [reference][1]  

The dataset was specifically downloaded from this adress: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

For instructions on downloading and preparations see the README-file and the R-script.

The resulting tidy dataset is uploaded to Coarsera with the name tidyset.txt and is a space-separated textfile.

## Data gathering

The variables are gathered by letting 30 persons carry a smartphone for a certain amount of time. The accelerometer and gyroscope in the phone recorded the movements, accelerations and directions 50 times per second. The information was then filtered in order to get useful measurs of body movement. For a better technical description see the file features_info.txt that should have been downloaded together with the data.

## Data manipulation

In order to produce the final dataset, tidyset.txt mentioned above several smaller sets had to be combined. For the exact way it was done, please see the R-script run_analysis.R.

Basically it is two main datasets with the measurements and derivations of the measurements that is held in the two files:   
>X_test  
>X_train 

In addition to these datasets there is small datasets that really is vectors containing information needed to identify the individuals, variables and activities in the main datasets. These vectors with information about the data is:  
>features.txt
>y_test.txt
>subject_test.txt
>y_train.txt
>subject_train

These are read into R and attached to the main data resulting in a data frame where each measurement is named properly as a variable and each row contains information on who (subject) carried the phone and what activity that gave rise to the information.

## Data creation

### The large data frame
Once the data is manipulated into the form of a single large data frame it contains 10299 observations on the 30 subjects having done 6 different activities. The differetnt measures provided is 561 and we are not interested in all of those. Instead we drop all variables that is not either the mean or the standard deviation of a certain measure at a certain time. We then end up with 86 variables but there is still 10299 observations.

### The small and final data frame
The large dataframe contains information on the 30 subjects, their activities (6 different) and the measurements (86 different). There is multiple measurements for all subjects when they are for example sitting or walking. For unclear reasons we calculate the average of the variables/measurements for a certain person doing a certain activity. Each person does 6 different activities. There are 86 measurements and for each of these. We end up with a data frame with six rows for each subject containing the average of each variable that person had recorded. What to do with it? I don't know. But that is the dataset you find in the file tidyset.txt.



## Description of variables

I am not into data analysis because of technical stuff. I like social science and then you usually know what a measurement is about. What is measured and what it mean. In this case I am more uncertain. Therefor I see no point in me giving unreliable variable descriptions for each and everyone. Instead, if you actually are interested in what the measures mean I suggest you consult the original documentation.
Below I instead try to give you an orientation to the 88 variables you encounter in the dataset tidyset.txt.

### Variables about who and what is measrued

"1" "subject" --- The identity of the person in the study   
"2" "activity" --- The activity the person did when measured

### Variables that are the different measurements, now averaged

Variables below are the averaged measurements from each subject doing one of the 6 possible activities. The variable names hints about what they are about. Body acceleration is measurements that have derived the part of the body's acceleration that is due to movement. The rest is from gravity as I have understood it and you find measurements on that in variables with GravityAcc in their names.

Small t before variable means time (not that I know really what time, but anyway :-)

The capital X, Y and Z indicates the three possible spatial dimensions.

Jerk is a calculated measure that tries to encompass that the body changed direction and at what pace. In some variables Mag is included in the name and that means it was a measure of the magnitude.

The f-prefix is something about a technique the researchers used to manipulate the measurements. It stands for Fast Fourier transformation and I suggest you go to the original documentation and try to find out what it is if you think you'll benefit from it.

The following variables are those included in the dataset:

"3" "tBodyAcc.mean...X"   
"4" "tBodyAcc.mean...Y"   
"5" "tBodyAcc.mean...Z"   
"6" "tGravityAcc.mean...X"   
"7" "tGravityAcc.mean...Y"   
"8" "tGravityAcc.mean...Z"   
"9" "tBodyAccJerk.mean...X"   
"10" "tBodyAccJerk.mean...Y"   
"11" "tBodyAccJerk.mean...Z"   
"12" "tBodyGyro.mean...X"   
"13" "tBodyGyro.mean...Y"   
"14" "tBodyGyro.mean...Z"   
"15" "tBodyGyroJerk.mean...X"   
"16" "tBodyGyroJerk.mean...Y"   
"17" "tBodyGyroJerk.mean...Z"   
"18" "tBodyAccMag.mean.."   
"19" "tGravityAccMag.mean.."   
"20" "tBodyAccJerkMag.mean.."   
"21" "tBodyGyroMag.mean.."   
"22" "tBodyGyroJerkMag.mean.."   
"23" "fBodyAcc.mean...X"   
"24" "fBodyAcc.mean...Y"   
"25" "fBodyAcc.mean...Z"   
"26" "fBodyAcc.meanFreq...X"   
"27" "fBodyAcc.meanFreq...Y"   
"28" "fBodyAcc.meanFreq...Z"   
"29" "fBodyAccJerk.mean...X"   
"30" "fBodyAccJerk.mean...Y"   
"31" "fBodyAccJerk.mean...Z"   
"32" "fBodyAccJerk.meanFreq...X"   
"33" "fBodyAccJerk.meanFreq...Y"   
"34" "fBodyAccJerk.meanFreq...Z"   
"35" "fBodyGyro.mean...X"   
"36" "fBodyGyro.mean...Y"   
"37" "fBodyGyro.mean...Z"   
"38" "fBodyGyro.meanFreq...X"   
"39" "fBodyGyro.meanFreq...Y"   
"40" "fBodyGyro.meanFreq...Z"   
"41" "fBodyAccMag.mean.."   
"42" "fBodyAccMag.meanFreq.."   
"43" "fBodyBodyAccJerkMag.mean.."   
"44" "fBodyBodyAccJerkMag.meanFreq.."   
"45" "fBodyBodyGyroMag.mean.."   
"46" "fBodyBodyGyroMag.meanFreq.."      
"47" "fBodyBodyGyroJerkMag.mean.."   
"48" "fBodyBodyGyroJerkMag.meanFreq.."   
"49" "angle.tBodyAccMean.gravity."   
"50" "angle.tBodyAccJerkMean..gravityMean."   
"51" "angle.tBodyGyroMean.gravityMean."   
"52" "angle.tBodyGyroJerkMean.gravityMean."   
"53" "angle.X.gravityMean."   
"54" "angle.Y.gravityMean."   
"55" "angle.Z.gravityMean."   
"56" "tBodyAcc.std...X"   
"57" "tBodyAcc.std...Y"   
"58" "tBodyAcc.std...Z"   
"59" "tGravityAcc.std...X"   
"60" "tGravityAcc.std...Y"   
"61" "tGravityAcc.std...Z"   
"62" "tBodyAccJerk.std...X"   
"63" "tBodyAccJerk.std...Y"   
"64" "tBodyAccJerk.std...Z"   
"65" "tBodyGyro.std...X"   
"66" "tBodyGyro.std...Y"   
"67" "tBodyGyro.std...Z"   
"68" "tBodyGyroJerk.std...X"   
"69" "tBodyGyroJerk.std...Y"   
"70" "tBodyGyroJerk.std...Z"   
"71" "tBodyAccMag.std.."   
"72" "tGravityAccMag.std.."   
"73" "tBodyAccJerkMag.std.."   
"74" "tBodyGyroMag.std.."   
"75" "tBodyGyroJerkMag.std.."   
"76" "fBodyAcc.std...X"   
"77" "fBodyAcc.std...Y"   
"78" "fBodyAcc.std...Z"   
"79" "fBodyAccJerk.std...X"   
"80" "fBodyAccJerk.std...Y"   
"81" "fBodyAccJerk.std...Z"   
"82" "fBodyGyro.std...X"   
"83" "fBodyGyro.std...Y"   
"84" "fBodyGyro.std...Z"   
"85" "fBodyAccMag.std.."   
"86" "fBodyBodyAccJerkMag.std.."   
"87" "fBodyBodyGyroMag.std.."   
"88" "fBodyBodyGyroJerkMag.std.."   

## Reference and original documentation

[1]:  Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012