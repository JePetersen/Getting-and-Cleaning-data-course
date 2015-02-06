---
title: "README"
author: "Jesper Petersen"
date: "Friday, February 06, 2015"
output: html_document
---

## Course Getting and cleaning data
See general course description [here](https://www.coursera.org/course/getdata)

You are reading the readme-file for the course project. Basically the task has been to download, manipulate and present a dataset and add proper documentation.

In order to replicate the analysis you need to make sure that you download the data and keep the file structure as the script and codebook describe. Otherwise the script won't fins the files.

Data is from *Human Activity Recognition Using Smartphones Data Set*. For full documentation of the original dataset please see the UCI Machine learning repository's [storage of the data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Full [reference][1]  

The dataset was specifically downloaded from this adress: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The script contains a download command and the URL. Either you use it as is or you download the files separately. Just make sure that you gather them and set your working directory to the folder in a way that when you type `list.files()`
you have the following files in your directory:

>[1] "activity_labels.txt" "features.txt"        "features_info.txt"  
>[4] "README.txt"          "test"                "train"

The R-code is contained in the the file run_analysis.R and most steps are commented upon within the script. For details on variables and decisions see the coodebook. The R-script assumes that the packages "dplyr", "reshape" and "tidyr" is installed.

[1]:  Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012