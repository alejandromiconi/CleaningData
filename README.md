# Project 

Cleaning the "wear a smartphone on the waist" data set 


# Author

ALEJANDRO MICONI
5/18/2020


# Introduction

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. 
You will be required to submit: 

1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Arquitecture


Main program: run_analysis.R

### Merge files.R => merge_files(): Merges the training and the test sets to create one data set.
### Work with fields.R => extract_some(dataset, field list): Extracts only the measurements on the mean and standard deviation for each measurement. 
### Work with fields.R => rename_fields(dataset): Appropriately labels the data set with descriptive variable names => Answer 4! (ds_some_rename data.frame)
### Summarize.R => sum_dataset(dataset): Summarize data set (with original names)
### Work with fields.R => rename_fields(summarized data set): Appropriately labels the data set with descriptive variable names => Answer 5! (ds_summary data.frame)

## Merge files.R

	merge_files()  

		- read features file (./data/features.txt)
		- read activities file (./data/activity_labels.txt)
		- read subject test file (./data/test/subject_test.txt)
		- read X test file (./data/test/X_test.txt)
		- read Y test file (./data/test/y_test.txt)
		- merge X test + subject test + Y test + activities
		- read subject train file (./data/train/subject_train.txt)
		- read X train file (./data/train/X_train.txt)
		- read Y train file (./data/train/y_train.txt)
		- merge X train + subject train + Y train + activities
		- rbind test + train
		- return dataset

## Work with fields.R

	extract_some(dataset, field list)

		- builds a list with dataset fields, that matchs with "field list"
		- select fields on list in dataset

	
	rename_fields(dataset)

		- builds a list that find known tokens on every column in dataset and replace with an appropriate label
		- replace the colnames with the builded list


## Summarize.R

	sum_dataset(dataset)

		- group dataset by activity and subject
		- calculate mean with "summarise_at" at every field except activity and subject
		- return summarized dataset


## Codebook.txt

Data to indicate all the variables and summaries calculated, along with units, and any other relevant information.