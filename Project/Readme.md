This repo includes the script file:
*run_analysis.R
*project.txt
*CodeBook.md

The Script works:
*Open the files corresponding to test and bind it with cbind(), then do the same with train files, and finally join all with rbind(), and store it in "data"
*Open features.txt in order to get the names of the columns of the whole dataframe, and select the names of the columns that we want, i.e, those that includes mean() and std(), and we stored that information in a vector called column. With this information we subset "data" storing the information in "data_extract"
*We change in "data_extract" the code of the activity by the name of the activity by mean a loop for, and conditional sentences.
*Then we change the names of the columns, by the names of the parameter that is in features.txt, using the information of the vector column which has been ordered. We do it by means a loop for that stores the name of the parameter in a vector called temp_data_name. Then I have added the names "Activity" and "Subject" and set it as the column names of data_extract.
*I have used aggregate() to order the information as the project tells, and stored it in a new data frame called data_table. Then I changed the order of the columns and changed the names again, bacause with aggregate() I had lost the names of the columns.
*Finally, I stored the information in a file, that is included in the repo too, with write.table()

I have used a lot of vectors and variables to not lose information and get back if it were necessary.
