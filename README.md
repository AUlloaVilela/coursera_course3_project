It was required to write an R script that transformed the provided original data from this source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
that generates a txt output file containing the averages of certain columns from the original data set (The CodeBook file explains the columns that are analyzed.)

All required steps involved in the required analysis tasks are preformed in a single script called "run_analysis.R" that can be found in this repository.
The script was developed in R Studio (Version 0.98.1028) with R version 3.1.1 on a Mac computer with the operating system OS X Mavericks.
In order to obtain the final result, it is only necessary to run the script (either in R directly or in R Studio). The scrip will check if the R packages and the data is avaible, otherwise it will proceed to install/save the necessary material.

The script can be structured into following steps:

1. Since the R packages "dplyr" and "sqldf" are used in the script; it will be checked if they are installed. If not , they will be installed and be called up before going into further steps.

2. The script will also check if the original data is previously stored in the R Working Directory in a folder called "C3_Project > UCI HAR Dataset" ; otherwise the script will create this directory and will download the dataset into it.

3. The script will perform all required task in the project (Merge the train and test datasets, select the whished columns, uses descriptive names for the 6 activites measured, replace column names with more descriptive ones, and calculates the means of the selected columns). In order to make the script more understandable, all major steps involved in the data transformation process are described within the script with comment lines (all lines starting with ##).

4. After the data processing the required output txt file will be stored in the Working Directory under "C3_Project". The name of this file is : "Final_Data.txt"

5. This final output data will also be stored into an R object called "final_data_frame", and can be called in R with the following command:    final_data_frame <- read.table("./C3_Project/Final_Data.txt",header=TRUE) 

