variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md
#CodeBook.md

This code book describes the data in the tidy data set produced by the run_analysis.R script in this repository.

## Source Data
The original data comes from the Human Activity Recognition Using Smartphones dataset hosted by the University of California, Irvine. See the citation at the end of this document for more information.

This dataset uses the following files from the source data:
* features.txt: variable names for measurements collected
* activity_labels.txt: descriptive names with corresponding activity codes for the six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
* train/X_train.txt: Measurements, training data set
* train/y_train.txt: Activity codes for training data
* train/subject_train.txt: Subjects (participants) for training data, 21 of the total 30 subject participating
* test/X_test.txt: Measurements, test data set
* test/y_test.txt: Activity codes for the test data
* test/subject_test.txt: Subjects (participants) for test data, nine of the total 30 subjects participating

## Transformations
After applying descriptive variable names as column headers and merging activity codes and subject codes with the measurement data in each of the test and training data sets, this script combines the two sets, replaces the activity codes with descriptive activity labels, and filters out all variables that do not contain mean or standard deviation values. Upon sourcing, the script with produce two dataframes:
* merged_set: This dataframe includes information for each subject and activity for each remaining measurement.
* tidy_set: This dataframe summarizes merged_set, displaying the mean for each variable for each subject and each activity in merged_set.

## Variables
The merged_set and tidy_set dataframes include the same 88 variables.
* activity: descriptive activity being measured
* subject: participant number of subject being measured

The original dataset's features_info.txt file describes the remaining variables in detail, including methods of calculation and units of measure. To briefly summarize, variables reproduced here may have one of two prefixes. The prefix "t" denotes that the signal is from the time domain, and was measured at a constant rate of 50 Hz. The prefix "f" denotes frequency, and these measures come from applying a Fast Fourier Transform to the original measures. Variables may be suffixed with "-X", "-Y", or "-Z" to denote which of the 3-axial signals was measured. Each variable includes "mean()" or "std()" to denote whether it is the mean or standard deviation of the measure.

The remaining variables are:
* Acceleration signals created using low pass Butterworth filer with corner frequency of 0.3
** BodyAcc: Body acceleration portion of acceleration signal
** GravityAcc: Gravity acceleration portion of acceleration signal
* BodyGyro: body angular velocity signal
* Jerk signals derived from body linear acceleration and angular velocity
** BodyAccJerk: Body linear acceleration jerk signal
** BodyGyroJerk: Body angular velocity jerk signal
* Magnitude signals calculated using Euclidian norm
** BodyAccMag: Body acceleration magnitude signal
** GravityAccMag: Gravity linear acceleration magnitude signal
** BodyGyroMag: Body angular velocity magnitude signal
** BodyAccJerkMag: Body linear acceleration jerk magnitude signal
** BodyGyroJerkMag: Body angular velocity jerk magnitude signal
** BodyBodyAccJerkMag: undefined in original dataset, potentially a typo for the BodyAccJerkMag variable
** BodyBodyGyroMag: undefined in original dataset, potentially a typo for the BodyGyroMag variable
** BodyBodyGyroJerkMag:undefined in original dataset, potentially a typo for the BodyGyroJerkMag variable

##Citation
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 
