#Step 1. Loading and extracting data
#Step 2. Loading lookup activities and features information
#Step 3. Loading test data, dropping features without mean and std in names, merging with lookup variables of step 2 for more descriptive information
#Step 4. Loading train data, dropping features without mean and std in names, merging with lookup variables of step 2 for more descriptive information
#Step 5. Combining datasets of step 3 and 4 with simple rbind, as they are in same structure
#Step 6. Calculating average of all measures groupping by subject and activity
#Step 7. Exporting data and cleaning downloded/extracted files from step 1

Every step is commented in R script itself.