==================================================================
Summary Data from Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================

This run_analysis script relies on the Human Activity Recognition Using Smartphones Dataset 
(HARUSD) that is available for download here: http://archive.ics.uci.edu/ml/machine-learning-databases/00240/

It must be run from the working directory in which the unzipped data is located 
(that is, where the 'test' and 'train' folders are the immediate subdirectories).

The HARUSD consists of three separate data file types, each created for 'test' 
and 'train' data plus descriptive files that give values for column names and 
activity numbers. This script joins the data together in a single file and 
returns the average of each mean and standard deviation.

Note: This README explains the data only as it relates to the processes for this file, 
including some summary discussion of the processing preformed on the original raw 
data. The author of this script is not an expert in the underlying mechanics of the 
transforms that Anguita et al performed on the original data. Please review the 
README data file included in zip download listed above or located here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

---------

Background: The original experiments for this data consisted of 30 volunteers 
who performed each of six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone (Samsung Galaxy S II) on 
the waist. The "Inertial Signals" subfolder, which was is not used in the run_analysis script, contains data accelerometer and gyroscopedata that was processed using noise 
reduction filters and transformed into summary data for body acceleration, gravity, 
and velocity data for each direction in which a subject moved (X, Y, and Z). 

This script process the summary files listed below, which were originally described
by Anguita et al. Their description is included here with additional annotation.


- 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features.txt': List of all features. This file comprises the labels for the 
columns in the X_test.txt and X_train.txt files.

- 'features_info.txt': Shows information about the variables used on the feature 
vector.

- 'activity_labels.txt': Links the activity number in the y_test and y_train 
files with their activity name.

- 'train/X_train.txt': Training set. A 561-feature vector with time and frequency 
domain variables. 

- 'train/y_train.txt': Activity number performed for each observation

- 'test/X_test.txt': Test set. A 561-feature vector with time and frequency 
domain variables for each observation.

- 'test/y_test.txt': Test labels.

The following files are applicable to both the train and test data.  

- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


References:
========

Original data set: 
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

