#Code Book

This code book to understand the tidy data createt in this course project

sbject.id       int of length 1
        Each ID identifies the subject who performed the activity carring the Samsung Smartphone.
        Its range is from 1 to 30 
        1..30

activity        factor
        Descriptive name of the activity the subject has performed. 
        Possible activities are:  
        WALKING
        WALKING_UPSTAIRS
        WALKING_DOWNSTAIRS
        SITTING
        STANDING
        LAYING

variable        factor
        Shows variables used on the feature vector.
        Only features are listed with "std" or "mean" in the name.
        tBodyAcc mean X .. fBodyBodyGyroJerkMag std
        
value           int
        Shows mean value on the feature vactor.
        0.22159824394 .. -0.791349425076923
        