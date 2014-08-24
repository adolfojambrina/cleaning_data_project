##read data files in test folder
x_test<-read.table("test/X_test.txt",header=FALSE,stringsAsFactors=FALSE)
y_test<-read.table("test/y_test.txt",header=FALSE,stringsAsFactors=FALSE)
s_test<-read.table("test/subject_test.txt",header=FALSE,stringsAsFactors=FALSE)

##get information about dimension of data frames
dim(x_test)
dim(y_test)
dim(s_test)
## all have 2947 rows

##merge, in the following order, y_test, s_test and x_test
data_test<-cbind(y_test, s_test)
data_test<-cbind(data_test,x_test)

##read data files in train folder
x_train<-read.table("train/X_train.txt",header=FALSE,stringsAsFactors=FALSE)
y_train<-read.table("train/y_train.txt",header=FALSE,stringsAsFactors=FALSE)
s_train<-read.table("train/subject_train.txt",header=FALSE,stringsAsFactors=FALSE)

##get information about dimension of data frames
dim(x_train)
dim(y_train)
dim(s_train)
## all have 7352 rows

##merge, in the following order, y_train, s_train and x_train
data_train<-cbind(y_train, s_train)
data_train<-cbind(data_train,x_train)

##merge data test and data train by rows
data<-rbind(data_test, data_train)

##read data of features
features<-read.table("features.txt",header=FALSE,stringsAsFactors=FALSE)

##get index for data with functions that include mean() and std()

feat_mean<-grep("-mean()",features[,2],ignore.case=TRUE)
feat_std<-grep("-std()",features[,2],ignore.case=TRUE)

## fix both parameter together
column<-c(feat_mean, feat_std)

##columns that we want to extract: includes columns of code os activities and subject
index_data<-c(1,2,sort(column)+2)
data_extract<-data[,index_data]

##change code of activity by name of activity
for(i in 1:nrow(data_extract)){
      if(data_extract[i,1]==1){
            data_extract[i,1]<-"WALKING"
            
      }else if(data_extract[i,1]==2){
            data_extract[i,1]<-"WALKING_UPSTAIRS"
      }else if(data_extract[i,1]==3){
            data_extract[i,1]<-"WALKING_DOWNSTAIRS"
      }else if(data_extract[i,1]==4){
            data_extract[i,1]<-"SITTING"
      }else if(data_extract[i,1]==5){
            data_extract[i,1]<-"STANDING"
      }else{
            data_extract[i,1]<-"LAYING" 
      }
      
}

##Next part labels columns. For that I am going to use the names of the file features
##and "activity" for the first column, "subject" for the second
col_data_name<-c("Activity","Subject")
sort_column<-sort(column)
temp_data_name<-c()
for(j in 1:length(sort_column)){
      
      index_j<-features[sort_column[j],2]
      
      temp_data_name<-c(temp_data_name, index_j)
}

colnames(data_extract)<-c(col_data_name,temp_data_name)

##with "aggregate" I get the data frame, sorted by activity, subject and with the mean
##of the parameters
data_table<-aggregate(data_extract[,3:ncol(data_extract)],by=list(data_extract$Subject,data_extract$Activity), mean)

##change the order of the columns, in this way I get a tidier dataframe and change
##names again because in the previous step Subject an Activity were changed
data_table<-data_table[c("Group.2","Group.1",temp_data_name)]
colnames(data_table)<-c("Activity","Subject",temp_data_name)

##exports dataframe to a file
write.table(data_table,file="project.txt",row.names=FALSE, sep=";")


