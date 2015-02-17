run_analysis <- function() {
        ## create data frame of filenames for later file reading
        my_files <- data.frame(row.names=c("filename"),stringAsFactors=FALSE)
        my_files <- rbind(my_files,"features.txt")
        my_files <- rbind(my_files,"activity_labels.txt")
        base_url <- "./train"
        my_files <- rbind(my_files,paste(base_url,"X_train.txt",sep="/"))
        my_files <- rbind(my_files,paste(base_url,"y_train.txt",sep="/"))
        my_files <- rbind(my_files,paste(base_url,"subject_train.txt",sep="/"))
        #url <- paste(base_url,"Inertial Signals",sep="/")
        #my_files <- rbind(my_files,paste(url,"body_acc_x_train.txt",sep="/"))
        #my_files <- rbind(my_files,paste(url,"body_acc_y_train.txt",sep="/"))
        #my_files <- rbind(my_files,paste(url,"body_acc_z_train.txt",sep="/"))
        #my_files <- rbind(my_files,paste(url,"body_gyro_x_train.txt",sep="/"))
        #my_files <- rbind(my_files,paste(url,"body_gyro_y_train.txt",sep="/"))
        #my_files <- rbind(my_files,paste(url,"body_gyro_z_train.txt",sep="/"))
        #my_files <- rbind(my_files,paste(url,"total_acc_x_train.txt",sep="/"))
        #my_files <- rbind(my_files,paste(url,"total_acc_y_train.txt",sep="/"))
        #my_files <- rbind(my_files,paste(url,"total_acc_z_train.txt",sep="/"))      
        base_url <- "./test"
        my_files <- rbind(my_files,paste(base_url,"X_test.txt",sep="/"))
        my_files <- rbind(my_files,paste(base_url,"y_test.txt",sep="/"))
        my_files <- rbind(my_files,paste(base_url,"subject_test.txt",sep="/"))
        #url <- paste(base_url,"Inertial Signals",sep="/")
        #my_files <- rbind(my_files,paste(url,"body_acc_x_test.txt",sep="/"))
        #my_files <- rbind(my_files,paste(url,"body_acc_y_test.txt",sep="/"))
        #my_files <- rbind(my_files,paste(url,"body_acc_z_test.txt",sep="/"))
        #my_files <- rbind(my_files,paste(url,"body_gyro_x_test.txt",sep="/"))
        #my_files <- rbind(my_files,paste(url,"body_gyro_y_test.txt",sep="/"))
        #my_files <- rbind(my_files,paste(url,"body_gyro_z_test.txt",sep="/"))
        #my_files <- rbind(my_files,paste(url,"total_acc_x_test.txt",sep="/"))
        #my_files <- rbind(my_files,paste(url,"total_acc_y_test.txt",sep="/"))
        #my_files <- rbind(my_files,paste(url,"total_acc_z_test.txt",sep="/"))
        sequence <- 2:nrow(my_files)
        ## read data into List of Data Frames
        my_list <- list()
        for (i in sequence){
                #print(i)
                if(i==4 | i==7){
                        my_list[[i-1]] <-read.table(my_files[i,],header=FALSE,col.names=as.vector(as.matrix(my_list[[1]][2])))   
                }
                else if(i==5|i==8){
                        my_list[[i-1]] <-read.table(my_files[i,],header=FALSE,col.names=c("actvity")) 
                }
                else if(i==6|i==9){
                        my_list[[i-1]] <-read.table(my_files[i,],header=FALSE,col.names=c("subject")) 
                }
                else{
                        my_list[[i-1]] <-read.table(my_files[i,],header=FALSE)
                }
        }
        #print(as.vector(as.matrix(my_list[[1]][2])))
        my_dataset_1 <- cbind(my_list[[5]],my_list[[4]],my_list[[3]])
        my_dataset_2 <- cbind(my_list[[8]],my_list[[7]],my_list[[6]])
        my_dataset <- rbind(my_dataset_1,my_dataset_2)
        print(dim(my_dataset))
        print(colnames(my_dataset))
        # merge to my_dataset
        # my_dataset_1 <- data.frame()
        # my_dataset_2 <- data.frame()
        # for (i in 3:14){
        #        print(summary(my_list[[i]]))
        #        my_dataset_1 <- cbind(my_dataset_1,my_list[[i]])
        #}
        #for(i in 15:26){
        #        print(summary(my_list[[i]]))
        #        my_dataset_2 <- cbind(my_dataset_2,my_list[[i]])
        #}
        #my_dataset_train <- cbind(my_list[[5]],my_list[[4]],mean(as.numeric(as.character(my_list[[3]]))),mean(as.numeric(as.character(my_list[[6]]))),mean(as.numeric(as.character(my_list[[7]]))),mean(as.numeric(as.character(my_list[[8]]))),mean(as.numeric(as.character(my_list[[9]]))),mean(as.numeric(as.character(my_list[[10]]))),mean(as.numeric(as.character(my_list[[11]]))),mean(as.numeric(as.character(my_list[[12]]))),mean(as.numeric(as.character(my_list[[13]]))),mean(as.numeric(as.character(my_list[[14]]))))
        #my_dataset_test <- cbind(my_list[[17]],my_list[[16]],my_list[[15]],my_list[[18]],my_list[[19]],my_list[[20]],my_list[[21]],my_list[[22]],my_list[[23]],my_list[[24]],my_list[[25]],my_list[[26]])
        #my_dataset <- rbind(my_dataset_train,my_dataset_test)
        #print(str(my_dataset))
}