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

Original Names:

1	tBodyAcc-mean()-X
2	tBodyGyro-mean()-X
3	tBodyGyro-mean()-Y
4	tBodyGyro-mean()-Z
5	tBodyGyro-std()-X
6	tBodyGyro-std()-Y
7	tBodyGyro-std()-Z
8	tBodyGyroJerk-mean()-X
9	tBodyGyroJerk-mean()-Y
10	tBodyGyroJerk-mean()-Z
11	tBodyGyroJerk-std()-X
12	tBodyGyroJerk-std()-Y
13	tBodyGyroJerk-std()-Z
14	tBodyAcc-mean()-Y
15	tBodyAccMag-mean()
16	tBodyAccMag-std()
17	tGravityAccMag-mean()
18	tGravityAccMag-std()
19	tBodyAccJerkMag-mean()
20	tBodyAccJerkMag-std()
21	tBodyGyroMag-mean()
22	tBodyGyroMag-std()
23	tBodyGyroJerkMag-mean()
24	tBodyGyroJerkMag-std()
25	fBodyAcc-mean()-X
26	fBodyAcc-mean()-Y
27	fBodyAcc-mean()-Z
28	fBodyAcc-std()-X
29	fBodyAcc-std()-Y
30	fBodyAcc-std()-Z
31	fBodyAcc-meanFreq()-X
32	fBodyAcc-meanFreq()-Y
33	fBodyAcc-meanFreq()-Z
34	tBodyAcc-mean()-Z
35	fBodyAccJerk-mean()-X
36	fBodyAccJerk-mean()-Y
37	fBodyAccJerk-mean()-Z
38	fBodyAccJerk-std()-X
39	fBodyAccJerk-std()-Y
40	fBodyAccJerk-std()-Z
41	fBodyAccJerk-meanFreq()-X
42	fBodyAccJerk-meanFreq()-Y
43	fBodyAccJerk-meanFreq()-Z
44	tBodyAcc-std()-X
45	tGravityAcc-mean()-X
46	tGravityAcc-mean()-Y
47	fBodyGyro-mean()-X
48	fBodyGyro-mean()-Y
49	fBodyGyro-mean()-Z
50	fBodyGyro-std()-X
51	fBodyGyro-std()-Y
52	fBodyGyro-std()-Z
53	tGravityAcc-mean()-Z
54	tGravityAcc-std()-X
55	tGravityAcc-std()-Y
56	fBodyGyro-meanFreq()-X
57	fBodyGyro-meanFreq()-Y
58	fBodyGyro-meanFreq()-Z
59	tGravityAcc-std()-Z
60	tBodyAcc-std()-Y
61	fBodyAccMag-mean()
62	fBodyAccMag-std()
63	fBodyAccMag-meanFreq()
64	fBodyBodyAccJerkMag-mean()
65	fBodyBodyAccJerkMag-std()
66	fBodyBodyAccJerkMag-meanFreq()
67	fBodyBodyGyroMag-mean()
68	fBodyBodyGyroMag-std()
69	fBodyBodyGyroMag-meanFreq()
70	fBodyBodyGyroJerkMag-mean()
71	fBodyBodyGyroJerkMag-std()
72	fBodyBodyGyroJerkMag-meanFreq()
73	angle(tBodyAccMean,gravity)
74	angle(tBodyAccJerkMean),gravityMean)
75	angle(tBodyGyroMean,gravityMean)
76	angle(tBodyGyroJerkMean,gravityMean)
77	angle(X,gravityMean)
78	angle(Y,gravityMean)
79	angle(Z,gravityMean)
80	tBodyAcc-std()-Z
81	tBodyAccJerk-mean()-X
82	tBodyAccJerk-mean()-Y
83	tBodyAccJerk-mean()-Z
84	tBodyAccJerk-std()-X
85	tBodyAccJerk-std()-Y
86	tBodyAccJerk-std()-Z

Final Names:

Time.Body.Accelerometer.mean...X
Time.Body.Gyroscope.mean...X
Time.Body.Gyroscope.mean...Y
Time.Body.Gyroscope.mean...Z
Time.Body.Gyroscope.Standard.Deviation...X
Time.Body.Gyroscope.Standard.Deviation...Y
Time.Body.Gyroscope.Standard.Deviation...Z
Time.Body.Gyroscope.Jerk.mean...X
Time.Body.Gyroscope.Jerk.mean...Y
Time.Body.Gyroscope.Jerk.mean...Z
Time.Body.Gyroscope.Jerk.Standard.Deviation...X
Time.Body.Gyroscope.Jerk.Standard.Deviation...Y
Time.Body.Gyroscope.Jerk.Standard.Deviation...Z
Time.Body.Accelerometer.mean...Y
Time.Body.Accelerometer.Magnitude.mean..
Time.Body.Accelerometer.Magnitude.Standard.Deviation..
Time.Gravity.Accelerometer.Magnitude.mean..
Time.Gravity.Accelerometer.Magnitude.Standard.Deviation..
Time.Body.Accelerometer.Jerk.Magnitude.mean..
Time.Body.Accelerometer.Jerk.Magnitude.Standard.Deviation..
Time.Body.Gyroscope.Magnitude.mean..
Time.Body.Gyroscope.Magnitude.Standard.Deviation..
Time.Body.Gyroscope.Jerk.Magnitude.mean..
Time.Body.Gyroscope.Jerk.Magnitude.Standard.Deviation..
Frequency.Body.Accelerometer.mean...X
Frequency.Body.Accelerometer.mean...Y
Frequency.Body.Accelerometer.mean...Z
Frequency.Body.Accelerometer.Standard.Deviation...X
Frequency.Body.Accelerometer.Standard.Deviation...Y
Frequency.Body.Accelerometer.Standard.Deviation...Z
Frequency.Body.Accelerometer.meanFreq...X
Frequency.Body.Accelerometer.meanFreq...Y
Frequency.Body.Accelerometer.meanFreq...Z
Time.Body.Accelerometer.mean...Z
Frequency.Body.Accelerometer.Jerk.mean...X
Frequency.Body.Accelerometer.Jerk.mean...Y
Frequency.Body.Accelerometer.Jerk.mean...Z
Frequency.Body.Accelerometer.Jerk.Standard.Deviation...X
Frequency.Body.Accelerometer.Jerk.Standard.Deviation...Y
Frequency.Body.Accelerometer.Jerk.Standard.Deviation...Z
Frequency.Body.Accelerometer.Jerk.meanFreq...X
Frequency.Body.Accelerometer.Jerk.meanFreq...Y
Frequency.Body.Accelerometer.Jerk.meanFreq...Z
Time.Body.Accelerometer.Standard.Deviation...X
Time.Gravity.Accelerometer.mean...X
Time.Gravity.Accelerometer.mean...Y
Frequency.Body.Gyroscope.mean...X
Frequency.Body.Gyroscope.mean...Y
Frequency.Body.Gyroscope.mean...Z
Frequency.Body.Gyroscope.Standard.Deviation...X
Frequency.Body.Gyroscope.Standard.Deviation...Y
Frequency.Body.Gyroscope.Standard.Deviation...Z
Time.Gravity.Accelerometer.mean...Z
Time.Gravity.Accelerometer.Standard.Deviation...X
Time.Gravity.Accelerometer.Standard.Deviation...Y
Frequency.Body.Gyroscope.meanFreq...X
Frequency.Body.Gyroscope.meanFreq...Y
Frequency.Body.Gyroscope.meanFreq...Z
Time.Gravity.Accelerometer.Standard.Deviation...Z
Time.Body.Accelerometer.Standard.Deviation...Y
Frequency.Body.Accelerometer.Magnitude.mean..
Frequency.Body.Accelerometer.Magnitude.Standard.Deviation..
Frequency.Body.Accelerometer.Magnitude.meanFreq..
Frequency.BodyBody.Accelerometer.Jerk.Magnitude.mean..
Frequency.BodyBody.Accelerometer.Jerk.Magnitude.Standard.Deviation..
Frequency.BodyBody.Accelerometer.Jerk.Magnitude.meanFreq..
Frequency.BodyBody.Gyroscope.Magnitude.mean..
Frequency.BodyBody.Gyroscope.Magnitude.Standard.Deviation..
Frequency.BodyBody.Gyroscope.Magnitude.meanFreq..
Frequency.BodyBody.Gyroscope.Jerk.Magnitude.mean..
Frequency.BodyBody.Gyroscope.Jerk.Magnitude.Standard.Deviation..
Frequency.BodyBody.Gyroscope.Jerk.Magnitude.meanFreq..
angle.Time.Body.Accelerometer.Mean.gravity.
angle.Time.Body.Accelerometer.Jerk.Mean..gravityMean.
angle.Time.Body.Gyroscope.Mean.gravityMean.
angle.Time.Body.Gyroscope.Jerk.Mean.gravityMean.
angle.X.gravity.Mean.
angle.Y.gravity.Mean.
angle.Z.gravity.Mean.
Time.Body.Accelerometer.Standard.Deviation...Z
Time.Body.Accelerometer.Jerk.mean...X
Time.Body.Accelerometer.Jerk.mean...Y
Time.Body.Accelerometer.Jerk.mean...Z
Time.Body.Accelerometer.Jerk.Standard.Deviation...X
Time.Body.Accelerometer.Jerk.Standard.Deviation...Y
Time.Body.Accelerometer.Jerk.Standard.Deviation...Z




The dataset includes the following files:
- 'README.txt' -> 
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
