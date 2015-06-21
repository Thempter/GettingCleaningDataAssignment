# GettingCleaningDataAssignment

There is a script in this repo named proyecto.R and I will explain the basics in this readme.

First of all it will get the merged dataframe for the observations and label the variables appropietly.
Then it will read the subjects and merged it as well. Also with the activity labels.

as it continues it adds the proper names for the activities. 
Then add activities and subjects columns to the merged dataframe.

Now we need to work only with the columns that are means or sd messurements so i filter themp using grep and subsetting.

for last, a tidy dataframe is created using aggregate function, gruping by subject and activity.