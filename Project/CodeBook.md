The stages that I have followed to complete this project are:
1) Merges the training and the test sets to create one data set.
I have used the following variables:
*x_test, y_test and s_test to open:test/X_test.txt, test/y_test.txt and test/subject_test.txt, which contains data of the test set, test labels and the code of the person who performs the test
*data_test for bind the mentiones variables. 
*x_train, y_train and s_train to open:train/X_train.txt, train/y_train.txt and train/subject_train.txt, which contains data of the test set, test labels and the code of the person who performs the test training
*data_train for bind the mentiones variables. 
*"data" for bind by row data_test and data_train. 
In order to know the dimensions of the vectors, data frames I have used dim()

2)Extracts only the measurements on the mean and standard deviation for each measurement.
I have used the following variables o names of dataframe:
*features to open: features.txt, which contains the information of the name of the variables/columns in the variable "data"
*feat_mean and feat_std to obtain the index that corresponds with the row with the name of the parameter of interest
*column to join the information of feat_mean an feat_std in the same vector
*index_data and data_extract: to subset with columns that we need. 


3)Uses descriptive activity names to name the activities in the data set.
*with the loop for I have changed the code of the activity by the name of the activity. The name is included in the activity labels

4)Appropriately labels the data set with descriptive variable names.
*I have used the names of the file features.txt.
*I have sorted the information of the vector column, with order(), and store the information with the name sort_column.
*With the For loop I have stored the name of the column, becouse before I only have the index. For that I used the variable index_j and the vector temp_data_name
*finally set the name of the columns "data_extract" with colnames()

5)Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
*data_table to store the new data frame that I have created in order to calculate the mean value for each parameter in function of the activity and the person who performs it.
*I have changed the initial order of the columns in order to get a tidier table, and changed the name of the columns, because aggregate had changed them
*with write.table I have stored the information in a file