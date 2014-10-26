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

The activity IDs have been later replaced by more descriptive labels


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
