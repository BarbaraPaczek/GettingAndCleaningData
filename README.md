GettingAndCleaningData
======================

This repository contains:
* **README.md**, that contains general information about the repository and description of the script used to obtain a tidy data set.
* **CodeBook.md**, that contains information about the data and variables.
* **Script run_analysis.r**, that can be used as long as the directory, in which the run_analysis.r is placed, is set to working directory. The Samsung data used for analysis should be in the same directory. The script is a script that works on Mac OS - it should be adjusted if it were to work on Windows ("/" in paths should be replaced by"\")
* **tidy_dataset.txt**, which is the output produced by the script. 

**The script uses Samsung data set (described in CodeBook.md) to produce a tidy data set containing the average of each variable for each activity and each subject.**

Steps performed by the script:

1. Saving paths to variables.
2. Loading data into R, using the paths saved to variables in previous step.
3. Labeling the data set with descriptive variable names, stored in features.
4. Extracting only the measurements on the mean and standard deviation for each measurement, using grep function.
5. Merging the data set with data on subjects and labels.
6. Merging the training and the test sets to create one data set.
7. Using descriptive activity names to name the activities in the data set, using function join from plyr package.
8. Creating a second, independent tidy data set with the average of each variable for each activity and each subject, using aggregate function.
9. Creating a txt file.
