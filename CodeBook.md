# Code Book - Human Activity Recognition Tidy Data

## Overview
This code book describes the variables, the data, and any transformations performed to clean up the collected data for the Getting and Cleaning Data course project.

## Study Design
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

## Identifiers
* `subject`: The ID of the test subject (ranges from 1 to 30).
* `activity`: The type of activity performed when the measurements were taken.

## Measurements (Averaged by Subject and Activity)
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. The measurements were cleaned and transformed to represent the average for each subject and activity combination.

* `TimeBodyAccelerometerMeanX`
* `TimeBodyAccelerometerMeanY`
* `TimeBodyAccelerometerMeanZ`
* `TimeBodyAccelerometerStandardDeviationX`
* `TimeBodyAccelerometerStandardDeviationY`
* `TimeBodyAccelerometerStandardDeviationZ`
*(Continue listing or describing the remaining cleaned feature columns)*

## Transformations
1. Merged the training and test sets to create one data set.
2. Extracted only the measurements on the mean and standard deviation for each measurement.
3. Replaced activity numeric codes with descriptive activity labels.
4. Cleaned variable names (e.g., expanded abbreviations like `t` to `Time` and `Acc` to `Accelerometer`).
5. Generated an independent tidy dataset containing the average of each variable for each activity and subject combination.