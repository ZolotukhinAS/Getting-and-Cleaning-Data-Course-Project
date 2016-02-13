library(dplyr)
library(tidyr)
library(stringr)

# TOREMOVE
setwd("D:\\PR\\Learning\\R\\Cleaning")

# Reading dataset folder function
ReadingDataFolder <- function(dataset = "test") {
        prevwd <- getwd()
        setwd(dataset)
        
        # reading subject IDS file. as simple vector
        subjects_raw <-read.table(paste("subject_",dataset,".txt",sep = ""), 
                                  header = FALSE, col.names = "subjectid")[,1]
        # reading activity information
        filename <-paste("Y_",dataset,".txt", sep ="")
        y_set_raw <- factor(read.table(file = filename , header = FALSE)[,1], 
                            levels = lu_activities$actid, labels = lu_activities$actname)
        
        # combining observation dataset with variables: observation, subjectid, activity
        observation_set <- data.frame(dataset = dataset,1:length(subjects_raw),subjects_raw,y_set_raw)
        names(observation_set) <- c("dataset","observation","subjectid","activity")
        
        
        # reading all 561 features data file. Name of column = name of feature.
        filename <-paste("X_",dataset,".txt", sep ="")
        x_set_raw <-tbl_df(read.fwf(file = filename , widths = c(17,rep(16,560)), 
                                    header = FALSE, col.names = lu_features$featurename))
        setwd(prevwd)
        
        # assigning link to observation by numering lines in sequence order
        print("start loading all features data")
        
        # we are interested only in some of the features. mean and std
        x_set_raw <- x_set_raw[,grep("-mean|-std",lu_features$featurename)]
        
        x_set_raw$observation <- seq(1, by = 1, length.out = nrow(x_set_raw))
        print("loaded all features data")
        
        observation_set%>% merge(x_set_raw, by.x = "observation", by.y = "observation")
}

# Start from here

# Downloading data
url <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
arcfilename <- "data.zip"
datafolder <-"Data"
download.file(url, arcfilename)

# Unzipping data
unzip(arcfilename, exdir = datafolder)

# Reading lookups
InitialFolder <- getwd()

# moving inside the folder
setwd(datafolder)
setwd(dir()[1])

lu_activities <- read.table("activity_labels.txt",header = FALSE, 
                            sep = " ", col.names = c("actid","actname"))
lu_features <- read.table("features.txt",header = FALSE, 
                          sep = " ", col.names = c("featureid","featurename"))



# Reading Test and train data and combining in one dataframe
data <- rbind(ReadingDataFolder("test"),ReadingDataFolder("train"))

# cleaning not necessary variables
rm(list = c("lu_features","lu_activities"))

# 
data_mean <- data %>% select(-dataset,-observation)
data_mean <- aggregate(data_mean[,-c(1:2)], 
                       list (subjectid = data_mean$subjectid, activity = data_mean$activity), 
                       mean )

# get to initial folder
setwd(InitialFolder)

# Cleaning all created files
unlink(datafolder, recursive = T)
unlink(arcfilename)

# exporting result dataset
write.table(data_mean,file = "data_mean.txt", row.names = F)

names(data)[-(1:4)]
