
#Merged. First training and then the test
mergedset <- rbind(read.table("train/X_train.txt"),read.table("test//X_test.txt"))

featureslabels <- read.table("features.txt")
#Got the names for the features
names(mergedset) <- featureslabels$V2 

#Arreglamos los carateres raros en los nombres porque sino se arma quilombo.
#names(mergedset) <- gsub("\\.|\\(|\\)|,|-","",names(mergedset))



#'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. 
#'Its range is from 1 to 30. 
mergedsubjectcode <- rbind(read.table("train/subject_train.txt"),read.table("test/subject_test.txt"))


mergedlabels <- rbind(read.table("train/y_train.txt"), read.table("test/y_test.txt"))


#meaninful names for actions
mergedlabels$V1[mergedlabels$V1 == 1] <- "WALKING" 
mergedlabels$V1[mergedlabels$V1 == 2] <- "WALKING_UPSTAIRS"
mergedlabels$V1[mergedlabels$V1 == 3] <- "WALKING_DOWNSTAIRS"
mergedlabels$V1[mergedlabels$V1 == 4] <- "SITTING"
mergedlabels$V1[mergedlabels$V1 == 5] <- "STANDING"
mergedlabels$V1[mergedlabels$V1 == 6] <- "LAYING"

names(mergedsubjectcode) <- "subject"
names(mergedlabels) <- "activity"
mergedset <- cbind(mergedsubjectcode,mergedlabels , mergedset)

#obtain the columns that refers only to std o mean messurements.
colindex <- grep(".*(std\\(\\)|mean\\(\\)).*",names(mergedset))


newdata <- mergedset[,c(1,2,colindex)]

tidyData <- aggregate(.~ subject + activity,newdata,mean,na.rm=T)

write.table(x = tidyData, file = "tidyTable.txt", row.name=FALSE)
