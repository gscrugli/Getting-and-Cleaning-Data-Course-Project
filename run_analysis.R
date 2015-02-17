run_analysis <- function() {
        ## create data frame of filenames for later file reading
        ## only read the train and test data; inertial data not needed because of definition of project
        my_files <- data.frame(row.names=c("filename"),stringAsFactors=FALSE)
        my_files <- rbind(my_files,"features.txt")
        my_files <- rbind(my_files,"activity_labels.txt")
        base_url <- "./train"
        my_files <- rbind(my_files,paste(base_url,"X_train.txt",sep="/"))
        my_files <- rbind(my_files,paste(base_url,"y_train.txt",sep="/"))
        my_files <- rbind(my_files,paste(base_url,"subject_train.txt",sep="/"))     
        base_url <- "./test"
        my_files <- rbind(my_files,paste(base_url,"X_test.txt",sep="/"))
        my_files <- rbind(my_files,paste(base_url,"y_test.txt",sep="/"))
        my_files <- rbind(my_files,paste(base_url,"subject_test.txt",sep="/"))
        sequence <- 2:nrow(my_files)
        
        ## now read files into List of Data Frames
        ## where possible add colnames
        my_list <- list()
        for (i in sequence){
                #print(i)
                if(i==4 | i==7){
                        my_list[[i-1]] <-read.table(my_files[i,],header=FALSE,col.names=as.vector(as.matrix(my_list[[1]][2])))   
                }
                else if(i==5|i==8){
                        my_list[[i-1]] <-read.table(my_files[i,],header=FALSE,col.names=c("activity.id")) 
                }
                else if(i==6|i==9){
                        my_list[[i-1]] <-read.table(my_files[i,],header=FALSE,col.names=c("subject.id")) 
                }
                else if (i==3){
                        my_list[[i-1]] <-read.table(my_files[i,],header=FALSE,col.names=c("id","activity")) 
                }
                else{
                        my_list[[i-1]] <-read.table(my_files[i,],header=FALSE)
                }
        }
        
        ## extract mean and std columns in Test and train data
        my_train1 <- select(my_list[[3]],contains("mean",ignore.case=TRUE))
        my_train2 <- select(my_list[[3]],contains("std",ignore.case=TRUE))
        my_train <- cbind(my_train1,my_train2)
        my_test1 <- select(my_list[[6]],contains("mean",ignore.case=TRUE))
        my_test2 <- select(my_list[[6]],contains("std",ignore.case=TRUE))
        my_test <- cbind(my_test1,my_test2)
        
        ## merge file content into a merged data frame
        my_dataset_1 <- cbind(my_list[[5]],my_list[[4]],my_train)
        my_dataset_2 <- cbind(my_list[[8]],my_list[[7]],my_test)
        my_dataset <- rbind(my_dataset_1,my_dataset_2)
        
        ## Use descriptive activity names to name the activities in the data set
        my_dataset <- merge(my_list[[2]],my_dataset,by.x="id",by.y="activity.id",all=TRUE)

        # Appropriately label the data set with descriptive variable names
        
        # Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        
        # For submission create data set as a txt file created with write.table() using row.name=FALSE
        
}