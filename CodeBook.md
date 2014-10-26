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
This was doing by replacing:
- "t"  for "time"
- "f" for "Frequency"
- "Acc" for "Accelerometer"
- "Gyro" for "Gyroscope"
- "Mag" for "Magnitude"
- std for "Standard Deviation"

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

1	Time.Body.Accelerometer.mean...X
2	Time.Body.Gyroscope.mean...X
3	Time.Body.Gyroscope.mean...Y
4	Time.Body.Gyroscope.mean...Z
5	Time.Body.Gyroscope.Standard.Deviation...X
6	Time.Body.Gyroscope.Standard.Deviation...Y
7	Time.Body.Gyroscope.Standard.Deviation...Z
8	Time.Body.Gyroscope.Jerk.mean...X
9	Time.Body.Gyroscope.Jerk.mean...Y
10	Time.Body.Gyroscope.Jerk.mean...Z
11	Time.Body.Gyroscope.Jerk.Standard.Deviation...X
12	Time.Body.Gyroscope.Jerk.Standard.Deviation...Y
13	Time.Body.Gyroscope.Jerk.Standard.Deviation...Z
14	Time.Body.Accelerometer.mean...Y
15	Time.Body.Accelerometer.Magnitude.mean..
16	Time.Body.Accelerometer.Magnitude.Standard.Deviation..
17	Time.Gravity.Accelerometer.Magnitude.mean..
18	Time.Gravity.Accelerometer.Magnitude.Standard.Deviation..
19	Time.Body.Accelerometer.Jerk.Magnitude.mean..
20	Time.Body.Accelerometer.Jerk.Magnitude.Standard.Deviation..
21	Time.Body.Gyroscope.Magnitude.mean..
22	Time.Body.Gyroscope.Magnitude.Standard.Deviation..
23	Time.Body.Gyroscope.Jerk.Magnitude.mean..
24	Time.Body.Gyroscope.Jerk.Magnitude.Standard.Deviation..
25	Frequency.Body.Accelerometer.mean...X
26	Frequency.Body.Accelerometer.mean...Y
27	Frequency.Body.Accelerometer.mean...Z
28	Frequency.Body.Accelerometer.Standard.Deviation...X
29	Frequency.Body.Accelerometer.Standard.Deviation...Y
30	Frequency.Body.Accelerometer.Standard.Deviation...Z
31	Frequency.Body.Accelerometer.meanFreq...X
32	Frequency.Body.Accelerometer.meanFreq...Y
33	Frequency.Body.Accelerometer.meanFreq...Z
34	Time.Body.Accelerometer.mean...Z
35	Frequency.Body.Accelerometer.Jerk.mean...X
36	Frequency.Body.Accelerometer.Jerk.mean...Y
37	Frequency.Body.Accelerometer.Jerk.mean...Z
38	Frequency.Body.Accelerometer.Jerk.Standard.Deviation...X
39	Frequency.Body.Accelerometer.Jerk.Standard.Deviation...Y
40	Frequency.Body.Accelerometer.Jerk.Standard.Deviation...Z
41	Frequency.Body.Accelerometer.Jerk.meanFreq...X
42	Frequency.Body.Accelerometer.Jerk.meanFreq...Y
43	Frequency.Body.Accelerometer.Jerk.meanFreq...Z
44	Time.Body.Accelerometer.Standard.Deviation...X
45	Time.Gravity.Accelerometer.mean...X
46	Time.Gravity.Accelerometer.mean...Y
47	Frequency.Body.Gyroscope.mean...X
48	Frequency.Body.Gyroscope.mean...Y
49	Frequency.Body.Gyroscope.mean...Z
50	Frequency.Body.Gyroscope.Standard.Deviation...X
51	Frequency.Body.Gyroscope.Standard.Deviation...Y
52	Frequency.Body.Gyroscope.Standard.Deviation...Z
53	Time.Gravity.Accelerometer.mean...Z
54	Time.Gravity.Accelerometer.Standard.Deviation...X
55	Time.Gravity.Accelerometer.Standard.Deviation...Y
56	Frequency.Body.Gyroscope.meanFreq...X
57	Frequency.Body.Gyroscope.meanFreq...Y
58	Frequency.Body.Gyroscope.meanFreq...Z
59	Time.Gravity.Accelerometer.Standard.Deviation...Z
60	Time.Body.Accelerometer.Standard.Deviation...Y
61	Frequency.Body.Accelerometer.Magnitude.mean..
62	Frequency.Body.Accelerometer.Magnitude.Standard.Deviation..
63	Frequency.Body.Accelerometer.Magnitude.meanFreq..
64	Frequency.BodyBody.Accelerometer.Jerk.Magnitude.mean..
65	Frequency.BodyBody.Accelerometer.Jerk.Magnitude.Standard.Deviation..
66	Frequency.BodyBody.Accelerometer.Jerk.Magnitude.meanFreq..
67	Frequency.BodyBody.Gyroscope.Magnitude.mean..
68	Frequency.BodyBody.Gyroscope.Magnitude.Standard.Deviation..
69	Frequency.BodyBody.Gyroscope.Magnitude.meanFreq..
70	Frequency.BodyBody.Gyroscope.Jerk.Magnitude.mean..
71	Frequency.BodyBody.Gyroscope.Jerk.Magnitude.Standard.Deviation..
72	Frequency.BodyBody.Gyroscope.Jerk.Magnitude.meanFreq..
73	angle.Time.Body.Accelerometer.Mean.gravity.
74	angle.Time.Body.Accelerometer.Jerk.Mean..gravityMean.
75	angle.Time.Body.Gyroscope.Mean.gravityMean.
76	angle.Time.Body.Gyroscope.Jerk.Mean.gravityMean.
77	angle.X.gravity.Mean.
78	angle.Y.gravity.Mean.
79	angle.Z.gravity.Mean.
80	Time.Body.Accelerometer.Standard.Deviation...Z
81	Time.Body.Accelerometer.Jerk.mean...X
82	Time.Body.Accelerometer.Jerk.mean...Y
83	Time.Body.Accelerometer.Jerk.mean...Z
84	Time.Body.Accelerometer.Jerk.Standard.Deviation...X
85	Time.Body.Accelerometer.Jerk.Standard.Deviation...Y
86	Time.Body.Accelerometer.Jerk.Standard.Deviation...Z

As a last step, an extra file has been generated (Final_Data.txt), including the averages of all these 86 values grouped by Subject and Activity (Please see readme file in this repository for instructions on how to generate this final output file).

The original dataset includes the following files:
- 'README.txt' 
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training activity labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test activity labels.

## Features Info

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
