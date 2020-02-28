# single column
column=c(1,2,NA,3,45)

#get missing count
sum(is.na(column))

# Importing the dataset
dataset = read.csv('Data.csv')

#PART1
#get missing columns and their count with data type
missColCount=function(x){
  sum(is.na (x))
}

# apply on the dataset
sapply(dataset,missColCount)

#output
Country       Age    Salary Purchased 
        0         1         1         0 
        
#PART2
#get missing columns and their count with data type
missColCount=function(x){
  paste(sum(is.na (x)),class(x))
}

# apply on the dataset
sapply(dataset,missColCount)

#output
  Country         Age      Salary   Purchased 
 "0 factor" "1 integer" "1 integer"  "0 factor" 
