The data used for the analysis can be downloaded at :
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
(The R script "run_analysis.R" will do it for you if necessary).

The original data set is splitted into:
- test data (30 % of subjects) = 2947 records
- train data(70 % of subjects) = 7352 records
These 2 sets have been merged into a single dataset as per projects requirements (R object: full_data_set).
The files in the folder "Inertial Signals" has been dismissed in order to improve the clarity of output results, because this is the very raw data out of which the rest of the data set was processed.

The full_data_set object includes 10299 records with following columns
- All 561 features columns
- The subject ID
- The activity ID

The full_data_set has been subset by selecting only those columns where the column name include the substrings "mean" or "std" as per project requirements. The results is an R data frame called "mean_std_selection" that includes:
- The 86 features columns indicating mean or standard deviation values
- The subject ID
- The activity ID

The activity IDs have been later replaced by more descriptive labels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) . These can be found in the reference file 'activity_labels.txt' which is included in the original data set.

After that the original names of the 86 feature columns have been renamed into more descriptive ones.

##	ORIGINAL NAME		  ##	  FINAL NAME
1	tBodyAcc-mean()-X	/--/	Time.Body.Accelerometer.mean...X
2	tBodyGyro-mean()-X	/--/	Time.Body.Gyroscope.mean...X
3	tBodyGyro-mean()-Y	/--/	Time.Body.Gyroscope.mean...Y
4	tBodyGyro-mean()-Z	/--/	Time.Body.Gyroscope.mean...Z
5	tBodyGyro-std()-X	/--/	Time.Body.Gyroscope.Standard.Deviation...X
6	tBodyGyro-std()-Y	/--/	Time.Body.Gyroscope.Standard.Deviation...Y
7	tBodyGyro-std()-Z	/--/	Time.Body.Gyroscope.Standard.Deviation...Z
8	tBodyGyroJerk-mean()-X	/--/	Time.Body.Gyroscope.Jerk.mean...X
9	tBodyGyroJerk-mean()-Y	/--/	Time.Body.Gyroscope.Jerk.mean...Y
10	tBodyGyroJerk-mean()-Z	/--/	Time.Body.Gyroscope.Jerk.mean...Z
11	tBodyGyroJerk-std()-X	/--/	Time.Body.Gyroscope.Jerk.Standard.Deviation...X
12	tBodyGyroJerk-std()-Y	/--/	Time.Body.Gyroscope.Jerk.Standard.Deviation...Y
13	tBodyGyroJerk-std()-Z	/--/	Time.Body.Gyroscope.Jerk.Standard.Deviation...Z
14	tBodyAcc-mean()-Y	/--/	Time.Body.Accelerometer.mean...Y
15	tBodyAccMag-mean()	/--/	Time.Body.Accelerometer.Magnitude.mean..
16	tBodyAccMag-std()	/--/	Time.Body.Accelerometer.Magnitude.Standard.Deviation..
17	tGravityAccMag-mean()	/--/	Time.Gravity.Accelerometer.Magnitude.mean..
18	tGravityAccMag-std()	/--/	Time.Gravity.Accelerometer.Magnitude.Standard.Deviation..
19	tBodyAccJerkMag-mean()	/--/	Time.Body.Accelerometer.Jerk.Magnitude.mean..
20	tBodyAccJerkMag-std()	/--/	Time.Body.Accelerometer.Jerk.Magnitude.Standard.Deviation..
21	tBodyGyroMag-mean()	/--/	Time.Body.Gyroscope.Magnitude.mean..
22	tBodyGyroMag-std()	/--/	Time.Body.Gyroscope.Magnitude.Standard.Deviation..
23	tBodyGyroJerkMag-mean()	/--/	Time.Body.Gyroscope.Jerk.Magnitude.mean..
24	tBodyGyroJerkMag-std()	/--/	Time.Body.Gyroscope.Jerk.Magnitude.Standard.Deviation..
25	fBodyAcc-mean()-X	/--/	Frequency.Body.Accelerometer.mean...X
26	fBodyAcc-mean()-Y	/--/	Frequency.Body.Accelerometer.mean...Y
27	fBodyAcc-mean()-Z	/--/	Frequency.Body.Accelerometer.mean...Z
28	fBodyAcc-std()-X	/--/	Frequency.Body.Accelerometer.Standard.Deviation...X
29	fBodyAcc-std()-Y	/--/	Frequency.Body.Accelerometer.Standard.Deviation...Y
30	fBodyAcc-std()-Z	/--/	Frequency.Body.Accelerometer.Standard.Deviation...Z
31	fBodyAcc-meanFreq()-X	/--/	Frequency.Body.Accelerometer.meanFreq...X
32	fBodyAcc-meanFreq()-Y	/--/	Frequency.Body.Accelerometer.meanFreq...Y
33	fBodyAcc-meanFreq()-Z	/--/	Frequency.Body.Accelerometer.meanFreq...Z
34	tBodyAcc-mean()-Z	/--/	Time.Body.Accelerometer.mean...Z
35	fBodyAccJerk-mean()-X	/--/	Frequency.Body.Accelerometer.Jerk.mean...X
36	fBodyAccJerk-mean()-Y	/--/	Frequency.Body.Accelerometer.Jerk.mean...Y
37	fBodyAccJerk-mean()-Z	/--/	Frequency.Body.Accelerometer.Jerk.mean...Z
38	fBodyAccJerk-std()-X	/--/	Frequency.Body.Accelerometer.Jerk.Standard.Deviation...X
39	fBodyAccJerk-std()-Y	/--/	Frequency.Body.Accelerometer.Jerk.Standard.Deviation...Y
40	fBodyAccJerk-std()-Z	/--/	Frequency.Body.Accelerometer.Jerk.Standard.Deviation...Z
41	fBodyAccJerk-meanFreq()-X	/--/	Frequency.Body.Accelerometer.Jerk.meanFreq...X
42	fBodyAccJerk-meanFreq()-Y	/--/	Frequency.Body.Accelerometer.Jerk.meanFreq...Y
43	fBodyAccJerk-meanFreq()-Z	/--/	Frequency.Body.Accelerometer.Jerk.meanFreq...Z
44	tBodyAcc-std()-X	/--/	Time.Body.Accelerometer.Standard.Deviation...X
45	tGravityAcc-mean()-X	/--/	Time.Gravity.Accelerometer.mean...X
46	tGravityAcc-mean()-Y	/--/	Time.Gravity.Accelerometer.mean...Y
47	fBodyGyro-mean()-X	/--/	Frequency.Body.Gyroscope.mean...X
48	fBodyGyro-mean()-Y	/--/	Frequency.Body.Gyroscope.mean...Y
49	fBodyGyro-mean()-Z	/--/	Frequency.Body.Gyroscope.mean...Z
50	fBodyGyro-std()-X	/--/	Frequency.Body.Gyroscope.Standard.Deviation...X
51	fBodyGyro-std()-Y	/--/	Frequency.Body.Gyroscope.Standard.Deviation...Y
52	fBodyGyro-std()-Z	/--/	Frequency.Body.Gyroscope.Standard.Deviation...Z
53	tGravityAcc-mean()-Z	/--/	Time.Gravity.Accelerometer.mean...Z
54	tGravityAcc-std()-X	/--/	Time.Gravity.Accelerometer.Standard.Deviation...X
55	tGravityAcc-std()-Y	/--/	Time.Gravity.Accelerometer.Standard.Deviation...Y
56	fBodyGyro-meanFreq()-X	/--/	Frequency.Body.Gyroscope.meanFreq...X
57	fBodyGyro-meanFreq()-Y	/--/	Frequency.Body.Gyroscope.meanFreq...Y
58	fBodyGyro-meanFreq()-Z	/--/	Frequency.Body.Gyroscope.meanFreq...Z
59	tGravityAcc-std()-Z	/--/	Time.Gravity.Accelerometer.Standard.Deviation...Z
60	tBodyAcc-std()-Y	/--/	Time.Body.Accelerometer.Standard.Deviation...Y
61	fBodyAccMag-mean()	/--/	Frequency.Body.Accelerometer.Magnitude.mean..
62	fBodyAccMag-std()	/--/	Frequency.Body.Accelerometer.Magnitude.Standard.Deviation..
63	fBodyAccMag-meanFreq()	/--/	Frequency.Body.Accelerometer.Magnitude.meanFreq..
64	fBodyBodyAccJerkMag-mean()	/--/	Frequency.BodyBody.Accelerometer.Jerk.Magnitude.mean..
65	fBodyBodyAccJerkMag-std()	/--/	Frequency.BodyBody.Accelerometer.Jerk.Magnitude.Standard.Deviation..
66	fBodyBodyAccJerkMag-meanFreq()	/--/	Frequency.BodyBody.Accelerometer.Jerk.Magnitude.meanFreq..
67	fBodyBodyGyroMag-mean()	/--/	Frequency.BodyBody.Gyroscope.Magnitude.mean..
68	fBodyBodyGyroMag-std()	/--/	Frequency.BodyBody.Gyroscope.Magnitude.Standard.Deviation..
69	fBodyBodyGyroMag-meanFreq()	/--/	Frequency.BodyBody.Gyroscope.Magnitude.meanFreq..
70	fBodyBodyGyroJerkMag-mean()	/--/	Frequency.BodyBody.Gyroscope.Jerk.Magnitude.mean..
71	fBodyBodyGyroJerkMag-std()	/--/	Frequency.BodyBody.Gyroscope.Jerk.Magnitude.Standard.Deviation..
72	fBodyBodyGyroJerkMag-meanFreq()	/--/	Frequency.BodyBody.Gyroscope.Jerk.Magnitude.meanFreq..
73	angle(tBodyAccMean,gravity)	/--/	angle.Time.Body.Accelerometer.Mean.gravity.
74	angle(tBodyAccJerkMean),gravityMean)	/--/	angle.Time.Body.Accelerometer.Jerk.Mean..gravityMean.
75	angle(tBodyGyroMean,gravityMean)	/--/	angle.Time.Body.Gyroscope.Mean.gravityMean.
76	angle(tBodyGyroJerkMean,gravityMean)	/--/	angle.Time.Body.Gyroscope.Jerk.Mean.gravityMean.
77	angle(X,gravityMean)	/--/	angle.X.gravity.Mean.
78	angle(Y,gravityMean)	/--/	angle.Y.gravity.Mean.
79	angle(Z,gravityMean)	/--/	angle.Z.gravity.Mean.
80	tBodyAcc-std()-Z	/--/	Time.Body.Accelerometer.Standard.Deviation...Z
81	tBodyAccJerk-mean()-X	/--/	Time.Body.Accelerometer.Jerk.mean...X
82	tBodyAccJerk-mean()-Y	/--/	Time.Body.Accelerometer.Jerk.mean...Y
83	tBodyAccJerk-mean()-Z	/--/	Time.Body.Accelerometer.Jerk.mean...Z
84	tBodyAccJerk-std()-X	/--/	Time.Body.Accelerometer.Jerk.Standard.Deviation...X
85	tBodyAccJerk-std()-Y	/--/	Time.Body.Accelerometer.Jerk.Standard.Deviation...Y
86	tBodyAccJerk-std()-Z	/--/	Time.Body.Accelerometer.Jerk.Standard.Deviation...Z





The dataset includes the following files:
=========================================
- 'README.txt' -> 
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
