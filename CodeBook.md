#CodeBook for assignment of "Getting and Cleaning Data Course Project"

##Source data
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Task for assignment. As-is
Here is the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Result datasets description

Data located in txt file in required format:<return>
*data_mean.txt	-	**Combined mean values dataset**. Contains mean values for group of subject|activity from data.txt.



###**Combined mean values dataset** description

Data was calculated based on combined test and train dataset. It contains **averages** for all features' values grouped subjectid and activity. **Names of the variables were saved** even if it is now contains the avarage per subject | activity. 

####key attributes

* subjectid	(int)	-	1:30. Id of the subjects in experiment
* activity	(chr) 	-	different type of activities recorded by experiment.

####features' data
Following are variables in numeric datatype. 

Full description for all variables is available in source dataset codebook. Names of the variables kept in this script:

* BodyAcc.mean...X              
* tBodyAcc.mean...Y              
* tBodyAcc.mean...Z              
* tBodyAcc.std...X               
* tBodyAcc.std...Y               
* tBodyAcc.std...Z               
* tGravityAcc.mean...X           
* tGravityAcc.mean...Y           
* tGravityAcc.mean...Z           
* tGravityAcc.std...X            
* tGravityAcc.std...Y            
* tGravityAcc.std...Z            
* tBodyAccJerk.mean...X          
* tBodyAccJerk.mean...Y          
* tBodyAccJerk.mean...Z          
* tBodyAccJerk.std...X           
* tBodyAccJerk.std...Y           
* tBodyAccJerk.std...Z           
* tBodyGyro.mean...X             
* tBodyGyro.mean...Y             
* tBodyGyro.mean...Z             
* tBodyGyro.std...X              
* tBodyGyro.std...Y              
* tBodyGyro.std...Z              
* tBodyGyroJerk.mean...X         
* tBodyGyroJerk.mean...Y         
* tBodyGyroJerk.mean...Z         
* tBodyGyroJerk.std...X          
* tBodyGyroJerk.std...Y          
* tBodyGyroJerk.std...Z          
* tBodyAccMag.mean..             
* tBodyAccMag.std..              
* tGravityAccMag.mean..          
* tGravityAccMag.std..           
* tBodyAccJerkMag.mean..         
* tBodyAccJerkMag.std..          
* tBodyGyroMag.mean..            
* tBodyGyroMag.std..             
* tBodyGyroJerkMag.mean..        
* tBodyGyroJerkMag.std..         
* fBodyAcc.mean...X              
* fBodyAcc.mean...Y              
* fBodyAcc.mean...Z              
* fBodyAcc.std...X               
* fBodyAcc.std...Y               
* fBodyAcc.std...Z               
* fBodyAcc.meanFreq...X          
* fBodyAcc.meanFreq...Y          
* fBodyAcc.meanFreq...Z          
* fBodyAccJerk.mean...X          
* fBodyAccJerk.mean...Y          
* fBodyAccJerk.mean...Z          
* fBodyAccJerk.std...X           
* fBodyAccJerk.std...Y           
* fBodyAccJerk.std...Z           
* fBodyAccJerk.meanFreq...X      
* fBodyAccJerk.meanFreq...Y      
* fBodyAccJerk.meanFreq...Z      
* fBodyGyro.mean...X             
* fBodyGyro.mean...Y             
* fBodyGyro.mean...Z             
* fBodyGyro.std...X              
* fBodyGyro.std...Y              
* fBodyGyro.std...Z              
* fBodyGyro.meanFreq...X         
* fBodyGyro.meanFreq...Y         
* fBodyGyro.meanFreq...Z         
* fBodyAccMag.mean..             
* fBodyAccMag.std..              
* fBodyAccMag.meanFreq..         
* fBodyBodyAccJerkMag.mean..     
* fBodyBodyAccJerkMag.std..      
* fBodyBodyAccJerkMag.meanFreq.. 
* fBodyBodyGyroMag.mean..        
* fBodyBodyGyroMag.std..         
* fBodyBodyGyroMag.meanFreq..    
* fBodyBodyGyroJerkMag.mean..    
* fBodyBodyGyroJerkMag.std..     
* fBodyBodyGyroJerkMag.meanFreq..

##"Transformations and data cleaning steps". R script comments.##

1. Loading data from test dataset files
 * During load features that does not have "mean" or "std" in their names were dropped.
 * Data from X source dataset was merged with subject and activity information
2. Loading data from train dataset files (same sub steps as for "test")
3. test and train datasets were combined with simple rbind as thet do not intersect by definition. It makes "Combined dataset" result
4. dropped observation and dataset information from combined dataset
5. applying mean aggregation for all fields except subjectid and activity and store in new dataset. It makes "Combined mean values dataset" result
6. Saving dataset into output txt file.

If required, R script itself contains all necessary description for every step.