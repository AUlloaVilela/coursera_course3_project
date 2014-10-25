 ## Installing sqldf package if not already available
list.of.packages <- c("sqldf")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
## Starting package (sqldf) 
library(sqldf)

## Downloading data
if(!file.exists("./C3_Project/UCI HAR Dataset/features.txt"))
{ 
    dir.create("C3_Project")
    fileurl<- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileurl, destfile="./C3_Project/raw.zip")
    unzip("./C3_Project/raw.zip",exdir="./C3_Project")
}

## Reading data
features <- read.table ("./C3_Project/UCI HAR Dataset/features.txt")
activites<- read.table ("./C3_Project/UCI HAR Dataset/activity_labels.txt")
test_subjects <- read.table("./C3_Project/UCI HAR Dataset/Test/subject_test.txt")
test_data <- read.table("./C3_Project/UCI HAR Dataset/Test/X_test.txt")
test_labels <- read.table("./C3_Project/UCI HAR Dataset/Test/Y_test.txt")

train_subjects <- read.table("./C3_Project/UCI HAR Dataset/train/subject_train.txt")
train_data <- read.table("./C3_Project/UCI HAR Dataset/train/X_train.txt")
train_labels <- read.table("./C3_Project/UCI HAR Dataset/train/Y_train.txt")


## Adding ID column
id <-rownames(test_subjects)
test_subjects<-  cbind(id,test_subjects)
id <-rownames(test_labels)
test_labels<-  cbind(id,test_labels)
test_data <- cbind(id=rownames(test_data),test_data)

id <-rownames(train_subjects)
train_subjects<-  cbind(id,train_subjects)
id <-rownames(train_labels)
train_labels<-  cbind(id,train_labels)
train_data <- cbind(id=rownames(train_data),train_data)

## Merging datasets
merged_test <- merge(test_data,test_subjects, by="id")
full_merged_test <- merge(merged_test,test_labels, by="id")
merged_train <- merge(train_data,train_subjects, by="id")
full_merged_train <- merge(merged_train,train_labels, by="id")
rbinded_data_set <- rbind(full_merged_test,full_merged_train)
full_data_set <- rbinded_data_set[,2:564] ## eliminating ids

## Renaming columns
names(full_data_set)[562] <- "Subject"
names(full_data_set)[563] <- "Activity"

## Selecting mean and std columns
col_nrs <- list(sqldf("Select V1 
                      from features 
                      Where V2 like '%mean%' or V2 like '%std%'   
                      UNION
                      Select 562 as V1
                      UNION
                      Select 563 as V1 "))
col_nrs <- as.numeric(unlist(col_nrs))
mean_std_selection <- full_data_set[,col_nrs]

## Descriptive activity names
mean_std_selection$Activity [mean_std_selection$Activity==1] <- "WALKING"
mean_std_selection$Activity [mean_std_selection$Activity==2] <- "WALKING_UPSTAIRS"
mean_std_selection$Activity [mean_std_selection$Activity==3] <- "WALKING_DOWNSTAIRS"
mean_std_selection$Activity [mean_std_selection$Activity==4] <- "SITTING"
mean_std_selection$Activity [mean_std_selection$Activity==5] <- "STANDING"
mean_std_selection$Activity [mean_std_selection$Activity==6] <- "LAYING"

## Descriptive variable names
## Cleaning variable names
names(mean_std_selection)[1] <- "V1"
splitnames <- strsplit(names(mean_std_selection),"V")
first_elem <- function(x){x[2]}
column_numb <- sapply (splitnames,first_elem)
column_numb[87] <- "Subject"
column_numb[88] <- "Activity"
## Assign cleaned provisional names
names(mean_std_selection) <- column_numb

col_names <- as.data.frame(names(mean_std_selection))
names(col_names) <- "Prov_names"
merged_prov_names <- merge(col_names,features,by.x="Prov_names",by.y="V1")
merged_prov_names <- merged_prov_names[,2]
names(mean_std_selection) <- merged_prov_names
names(mean_std_selection)[87] <- "Subject"
names(mean_std_selection)[88] <- "Activity"

## Assigning descriptive variable names
names(mean_std_selection) <- sub("tB", "Time B", names(mean_std_selection))
names(mean_std_selection) <- sub("tG", "Time G", names(mean_std_selection))
names(mean_std_selection) <- sub("fB", "Frequency B", names(mean_std_selection))
names(mean_std_selection) <- sub("Gyro", " Gyroscope", names(mean_std_selection))
names(mean_std_selection) <- sub("Acc", " Accelerometer", names(mean_std_selection))
names(mean_std_selection) <- sub("Jerk", " Jerk", names(mean_std_selection))
names(mean_std_selection) <- sub("Mag", " Magnitude", names(mean_std_selection))
names(mean_std_selection) <- sub("std()", "Standard Deviation", names(mean_std_selection))
names(mean_std_selection) <- sub("Mean", " Mean", names(mean_std_selection))
names(mean_std_selection)<- gsub("-"," ",names(mean_std_selection))

## Calculating means for every variable
Final_Data_Frame <- mean_std_selection %>% 
    group_by(Subject,Activity) %>% 
    summarise_each(funs(mean))

## Writting result into a txt file
write.table(Final_Data_Frame,"./C3_Project/Final_Data.txt",row.name=FALSE)

## Reading final data 
final_data_frame <- read.table("./C3_Project/Final_Data.txt",header=TRUE)
print(final_data_frame)
