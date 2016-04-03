#Introduction

The script `run_analysis.R` performs the 5 steps described in the course project's definition.

•	Input data is merged by using the `rbind()` function. 
-	Files having the same number of columns and related  to the same entities.
-	Columns are renamed with the correct names, taken from `features.txt`.
•	Columns with the mean and standard deviation measures are used from the available dataset.  
•	Then activity data is addressed with values 1:6.
- Activity names and IDs are taken from `activity_labels.txt`, which are substituted in the dataset.
•	Removed parentheses, column names  made clearer (by using the `gsub()`).
•	A new dataset is generated  with all the average measurements for each subject and each activity type (by using the `ddply()`).
 The output file is called  `tidydata.txt`, which is uploaded to this repository.

#Variables
•	`x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.

•	`train_data`, `test_data` merge the previous datasets to further analysis.

•	labels contains the correct names for the data dataset, which are applied to the column names stored in data.

•	A similar approach is taken with activity names through the `activity_labels` variable.

•	`data_mean_std` contains the dataset after extracting only the measurements on the mean and standard deviation for each measurement from data dataset. 

•	`data_mean_std2` contains the dataset after Removed parentheses, column names  made clearer.

•	`tidydata` contains the relevant averages which will be later stored in a .txt file.  








