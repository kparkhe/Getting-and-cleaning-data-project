# Getting-and-cleaning-data-project

This is the course project for the Getting and Cleaning Data course on Coursera.

The files included are:

(1) This Readme

(2) A CodeBook describing the variables and calculations done

(3) A script run_analysis.R, which converts raw training and test data into a tidy data set, which is

(4) tidy.txt

The run_analysis.R script does the following things:

(1) Load in train data and test data

(2) Load in features (which indicates the variables in train data and test data), data regarding which of 30 subjects and 6 activities were involved in each row, and activity label data translating activity numbers into what they mean

(3) Merge the train data and test data rows together

(4) Use "features" to make variables descriptive

(5) Use activity labels to make activities descriptive

(6) Melt and cast data to find means of measurement variables grouped by the 180 subject-activity combinations

(7) Output the resulting tidy data frame as a .txt file
