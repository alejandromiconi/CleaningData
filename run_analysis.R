## The purpose of this project is to demonstrate your ability to collect, 
## work with, and clean a data set. The goal is to prepare tidy 
## data that can be used for later analysis. You will be graded by your 
## peers on a series of yes/no questions related to the project. 
## You will be required to submit: 
## 1) a tidy data set as described below, 
## 2) a link to a Github repository with your script for performing the analysis, and 
## 3) a code book that describes the variables, the data, 
## and any transformations or work that you performed to clean 
## up the data called CodeBook.md. You should also include a README.md 
## in the repo with your scripts. This repo explains how all of the scripts 
## work and how they are connected.
##
## The experiments have been carried out with a group of 30 volunteers 
## within an age bracket of 19-48 years. Each person performed six activities 
## (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
## wearing a smartphone (Samsung Galaxy S II) on the waist. 
## Using its embedded accelerometer and gyroscope, we captured 3-axial linear 
## acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
## The experiments have been video-recorded to label the data manually. 
## The obtained dataset has been randomly partitioned into two sets, 
## where 70% of the volunteers was selected for generating the training data 
## and 30% the test data. 
## 

rm(list=ls())

## 1.Merges the training and the test sets to create one data set.
ds_merge = merge_files()

#dim(ds_merge)

## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
ds_some = extract_some(ds_merge, c("\\.mean\\." , "\\.std\\.", "activity", "subject"))

#dim(ds_some)

## 3.Uses descriptive activity names to name the activities in the data set
## Function rename_fields(dataset) => renamed dataset

## 4.Appropriately labels the data set with descriptive variable names. 
ds_some_rename = rename_fields(ds_some)

## 5.From the data set in step 4, creates a second, 
## independent tidy data set with the average of each variable for each activity and each subject.
ds_summary = sum_dataset(ds_some)
ds_summary = rename_fields(ds_summary)

## To Control Summary DataSet
write.table(ds_summary,"./data/ds_summary.txt", row.name = FALSE)
