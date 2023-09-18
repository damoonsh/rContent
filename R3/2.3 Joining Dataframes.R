library(tidyverse)

"
  band_memebers: dataframe containing the name and band of each artist
  band_isntruments: dataframe containign the instrument each artist palys
"
band_members 
band_instruments

"
  Join functions:
  
  1. inner_join():
    - return all rows from x where there are matching values in y, and all 
      columns from x and y. If there are multiple matches between x and y, 
      all combination of the matches are returned.
  
  2. left_join():
    - return all rows from x, and all columns from x and y. Rows in x with no 
      match in y will have NA values in the new columns. If there are multiple 
      matches between x and y, all combinations of the matches are returned.
  
  3. right_join():
    - return all rows from y, and all columns from x and y. Rows in y with no 
      match in x will have NA values in the new columns. If there are multiple 
      matches between x and y, all combinations of the matches are returned.
  
  4. full_join():
    - return all rows and all columns from both x and y. Where there are not 
      matching values, returns NA for the one missing.
      
  refrence: https://dplyr.tidyverse.org/reference/join.html
"
# The four main types of joins are:

# 1. Left Join 



# 2. Inner Join



# 3. Right Join



# 4. Full Join




"
  Case Study:
    Imagine that we have gathered data about students enrolments in different
    university courses.
    
    course_rating: Contains courses and their rates given by students
    course_grades: Conatins course code, professor signatures, and students'
      grade averages.
      
  NOTE: The difference between these two datasets is that the course codes for
  the course_grades is different (assume we did not get the data for those courses).
"

courses <- c("ECN340", "MTH108", "CPS109", "ECN702", "ITM320") # Courses
prof_signs <- c("M.S", "D.H", "Y.U", "Z.D", "P.L") # Signatures
rates <- c(9.7, 5.4, 7.8, 6.5, 8.9) # Rates
grade_avg <- c(79, 85, 87, 67, 75) # Grade Averages

# Course Rating dataframe
course_rating <- data.frame(courses, rates) 

courses <- c("ECN340", "MTH210", "CPS209", "ECN702", "ITM320")
# Course Grades dataframe
course_grades <- data.frame(courses, prof_signs, grade_avg) 

# Exercise: Run each of the join functions on course_grades and rating dataframes
# 1. Left Join 



# 2. Inner Join



# 3. Right Join



# 4. Full Join




