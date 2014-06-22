GetAndCleanProject
==================

Coursera Getting and Cleaning Project work

This README document explains how the associated R program "run_analysis R"
uses the UCI repository data collected from 30 subjects using the Samsung Galaxy
S smart phone.
There are two data sets called "train" and "test".  
These data sets contain information about 30 subjects, each doing one of the following tasks: "WALKING, WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING, STANDING
AND LAYING""

It is assumed that the dataset has been unzipped and put in the appropriate data directory.

## Steps in the project(as well as in run_analysis.R)

### Step1 :Merging the two data sets "train" and "test"
The three files under the train and test directories  corresponding to the subject, activity and data from the accelerometers are stiched together along the columns to form a train and test data set.  
The files used are "X-train.txt","y-train.txt" and "subject_train.txt" in the train directory.  
The files used are "X-test.txt","y-test.txt" and "subject_test.txt" in the test directory. 
The train and test data sets are then stiched together along the rows.  

### Step2 :Replacing the activity index with the corresponding names
Even though , this step is "Step 2" in the assignment, I prefer to do it earlier. 
A column was created with the six different activities. This is then used as a lookup table to replace the contents of the Activity column in the data set.  

### Step 3:Extract measurements on the mean and standard deviation for each measurment
We will extract out only those columns that contain the mean values of the observations. The grep function was used to achieve this. 
There are a toal of 81 columns including subject and activity.

### Step 4: Label the data set column names appropriately
The column names were set according to how it is described in the code book.

### Step 5: Create a tidy data set
The data was reshaped using the "reshape" package.  
The melt and cast functions were used.  
The final data set has 180 observations and 81 columns. 
The data was written to a text file "tidydata.txt" using the "write.table" function








