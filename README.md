The course project required an R script that transformed the provided original data from this source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
and should have as output a txt file containing the averages of certain columns from the original data set (The CodeBook file explains the columns that are analyzed.)

The R script that perfoms the required analysis is called run_analysis.R an can be found in this repository.
The script was developed in R Studio (Version 0.98.1028) with R version 3.1.1 on a Mac computer withe the operating system OS X Mavericks.

The script can be structured into following steps:

1. The script checks if the R packages "dplyr" and "sqldf" are installed. If not , they will be installed and be called up before going into further steps.
2. The script will also check if the original data is previously stored in the R Working Directory in a folder called "C3_Project > UCI HAR Dataset" ; otherwise the script will create this directory and will download the dataset into it.
3. After data processing the required txt file will be stored in the Working Directory under "C3_Project". The name of this file is : "Final_Data.txt"

