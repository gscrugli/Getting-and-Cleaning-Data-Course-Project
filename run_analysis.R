run_analysis <- function() {
        ## create data frame of filenames for later
        my_files <- data.frame(row.names=c("filename"),stringAsFactors=FALSE)
        base_url <- "./train"
        my_files <- rbind(my_files,paste(base_url,"X_train.txt",sep="/"))
        my_files <- rbind(my_files,paste(base_url,"y_train.txt",sep="/"))
        url <- paste(base_url,"Inertial Signals",sep="/")
        my_files <- rbind(my_files,paste(url,"body_acc_x_train.txt",sep="/"))
        my_files <- rbind(my_files,paste(url,"body_acc_y_train.txt",sep="/"))
        my_files <- rbind(my_files,paste(url,"body_acc_z_train.txt",sep="/"))
        my_files <- rbind(my_files,paste(url,"body_gyro_x_train.txt",sep="/"))
        my_files <- rbind(my_files,paste(url,"body_gyro_y_train.txt",sep="/"))
        my_files <- rbind(my_files,paste(url,"body_gyro_z_train.txt",sep="/"))
        my_files <- rbind(my_files,paste(url,"total_acc_x_train.txt",sep="/"))
        my_files <- rbind(my_files,paste(url,"total_acc_y_train.txt",sep="/"))
        my_files <- rbind(my_files,paste(url,"total_acc_z_train.txt",sep="/"))      
        base_url <- "./test"
        my_files <- rbind(my_files,paste(base_url,"X_test.txt",sep="/"))
        my_files <- rbind(my_files,paste(base_url,"y_test.txt",sep="/"))
        url <- paste(base_url,"Inertial Signals",sep="/")
        my_files <- rbind(my_files,paste(url,"body_acc_x_test.txt",sep="/"))
        my_files <- rbind(my_files,paste(url,"body_acc_y_test.txt",sep="/"))
        my_files <- rbind(my_files,paste(url,"body_acc_z_test.txt",sep="/"))
        my_files <- rbind(my_files,paste(url,"body_gyro_x_test.txt",sep="/"))
        my_files <- rbind(my_files,paste(url,"body_gyro_y_test.txt",sep="/"))
        my_files <- rbind(my_files,paste(url,"body_gyro_z_test.txt",sep="/"))
        my_files <- rbind(my_files,paste(url,"total_acc_x_test.txt",sep="/"))
        my_files <- rbind(my_files,paste(url,"total_acc_y_test.txt",sep="/"))
        my_files <- rbind(my_files,paste(url,"total_acc_z_test.txt",sep="/"))
        sequence <- 2:nrow(my_files)
        print(sequence)
        ## read data in List
        my_data <- list()
        for (i in sequence){
                print(i)
                my_data[[i]] <-read.delim(my_files[i,],header=FALSE) 
        }
        print(summary(my_data))
}