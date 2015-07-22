library(dplyr)
library(reshape2)

#  Returns merged measurement, activity, and subject data, with descriptive variable names.
make_set <- function(subject_table, x_table, y_table, features) {
        colnames(x_table) <- features[,2]
        colnames(y_table) <- "activity"
        colnames(subject_table) <- "subject"
        new_set <- cbind(x_table, y_table, subject_table)
        new_set[!duplicated(names(new_set))]
}
# Returns set of merged training and test data. 
# Merged set includes descriptive activity values, and limits variables to those
# concerning mean and standard deviation.
merge_sets <- function(test_set, train_set, act_labels){
        x <- merge(test_set, train_set, all=TRUE)
        x <- select(x, contains("mean()"), 
                    contains("std()"), 
                    matches("activity"), 
                    matches("subject"))
        mutate(x, activity=factor(x$activity, levels=act_labels[,1], labels=act_labels[,2]))
}

# Loads data set files from data folder into R
features <- read.table("features.txt")
act_labels <-read.table("activity_labels.txt")

sub_test <- read.table("test/subject_test.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")

sub_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

# Creates and cleans complete test and train data sets using make_set function above
test_set <- make_set(sub_test, x_test, y_test, features)
train_set <- make_set(sub_train, x_train, y_train, features)

# Creates tidy merged data set from test and train data using merge_sets function above
merged_set <- merge_sets(test_set, train_set, act_labels)

# Creates tidy data featuring averages for each subject and activity in merged_set
tidy_set <- merged_set %>%
        melt(id.vars=c("subject", "activity"), measure.vars=names(merged_set[1:66])) %>%
                dcast(subject + activity ~ variable, mean)