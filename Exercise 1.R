#### Exercise number 1 ####
#R is a big calculator!
2+2
2-2
2/2
2*2

#### Exercise number 2 ####
#Objects
x=2
y=3

x+y
x-y
x/y
x*y

#character variables

name <- "Zach"
seven <- "7"

seven + x

class(seven)
class(x)

# Concatenate Function
vec <- c(1,2,3,4,5,6,7)
vec <- c(1:7)
vec <- 1:7
vec2 <- c("Zach", "Jie", "Mich")
vec3 <- c(TRUE, FALSE, TRUE)

vec2[2]
vec + x

# Basic functions in R

vec
mean(vec)
sd(vec)
sum(vec)
median(vec)
min(vec)
max(vec)
summary(vec)
abs(vec)
sqrt(vec)
sqrt(sum(vec))
log(vec) #natural log
log10(vec)
exp(vec)

### Logical operators
# > greater than
# < less than
# | or
# & and
# = equal (used to assign values from left to right)
# == exactly equal to (used for showing equality between values)
# >= greater than or equal to
# != not equal to

1 > 2
1 < 2
1 <= 2
1 == 1 # asking if 1 is equal to 1
1 = 1
one = 1

t <- 1:10
t[(t > 8)]

# values of t such that t is greater than 8 or less than 5
t [(t > 8) | (t < 5)]

# values of t such that t is greater than 8 and less than 10
t [(t > 8) & (t < 10)]

# elements of t that are not  exactly equals to 2
t [t != 2]

# ask R if a number exists in a vector
2 %in% t
32 %in% t

## Data types
# Scalar objects
x
# Vectors
t

# Matrix
# Example of a numeric matrix
mat1 <- matrix(data = c(1, 2, 3), nrow = 3, ncol = 3)

# Character matrix
mat2 <- matrix(data = c("Zach", "Jie", "Mich"), nrow = 3, ncol = 3)

t[5]
mat1[1]
mat1[2]
mat1[3]
mat1[4]
mat1[9]

mat1[1,3] # first row, third column
mat1[1,]  # gives the first row
mat1[,3]  # gives the third column

#Dataframes
# Are like matrix, but with multiple data classes or data types (i.e. logical and numeric)
df <- data.frame(mat1[,1], mat2[,1])
df

colnames(df) <- c("value", "name")
df

df[1,2] # first row, second column
df[1]   # first column
df[,"value"]

df$value # acessing columns
df$value[1]
df$name[3]

# Subsetting or indexing 
# The element of the column value such that names is equal to Jie

df$value[df$name == "Jie"]
df$value[df$name == c("Jie", "Mich")] #longer object length is not a multiple of shorter object length
df$value[df$name %in% c("Jie", "Mich")]
df$value[df$name != "Zach"]

# Return the elements of the column value within the dataframe df such that name is not equal to Jie or/and Mich
df$value[!df$name %in% c("Jie", "Mich")]

# Subset function
subset(df, name == "Jie")

# Making a new column in a dataframe
df$log_value = log(df$value)
df$log_value
df

# Installing packages
# tidyverse
# lme4
# purrr

install.packages("tidyverse") # Installs the package from the CRAN repository

#install.packages("phyloseq")

library(tidyverse) # Loads the function into R

### Reading data into R
# CSV or TXT

# csv <- read.csv( ..., na.strings = "na") # used to read and upload the csv file. Use the path in the computer to get it (or setwd as the repository)
# csv2 <- file.choose()
# csv3 <- read.csv( file.choose(), na.strings = "na")
