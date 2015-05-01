#### The goal is to introduce you to R Programming Language ####
## By end of this workshop, you should be able to create and run your own R code and 
## perform basic data analysis

# Intro to R console and Rstudio, various sections, extensions
# Console, text editor window, graphics window, workspace window
# basic calculator, running commands/expressions on console
5 + 10
5 / 2
10/0
2*3 + 4*5 - 6/7
cos(45)
5 %% 3
2 ^ 2

# for more examples refer to baisc_calculator.html

# assignment operator (<-), (=), (->) 
age <- 24 # age is a vector object and 24 is assigned to this object

# Variable naming rules
# no space allowed
# variable name should not start with a number
# no dollar sign in variable name as $ has a significance in R
# age_r , var1, var.new

# taking help in R
#### Browse help documents - Try yourself  #####
?paste()
example(paste)

##### R in-built functions in R - Try yourself #####
myname <- "Abhinav"
paste("My name is", myname)

##### Data Structure - Vectors and lists - Try yourself ######

# There is a group in lab, define the group as follows with the character vector and
# giving the names of the group members
# Run below code to create the a vector group
group <- c("Amit", "Suresh", "Sonia", "John", "Ajay") 
group # display the vector
class(group) 
length(group) # gives number of elements in the vector
nchar(group) # number of characters in each element of the character vector
group[3] # displays the third element of the vector
sort(group)
sort(group, decreasing = T)

# Scores of student in different subjects out of 100 :
scores = c(20, 60, 70, 75, 80, 85)
mean(scores)
tot = sum(scores)
tot
percentage = tot/600 
percentage
summary(scores)

##  dealing with NA or missing values
scores = c(20, 60, 70, 75, 80, NA)
is.na(scores)
mean(scores, na.rm=T)
# complete.cases() could also be used
## List - collection of elements of different classes
List = list("Ram", "26", TRUE, 3+2i)
List

# For more examples, refer to vectors.html file

# a simple example of user defined function
power <- function(p, q){
  p^q
}
power(2,3)

## Try yourself
fib <- function(l){
  
  Fibonacci <- numeric(l)
  Fibonacci[1] <- Fibonacci[2] <- 1
  for (i in 3:l) {
    Fibonacci[i] <- Fibonacci[i - 2] + Fibonacci[i - 1]
  }
  
  Fibonacci
}

fib(5)





# Matrix
mat <- matrix(seq(1,4,1), nrow = 2, ncol = 2)
mat

# for more examples refer to Matrix.html

### Data Structure - Data Frame - Try yourself ####
let us create a data frame that has the day of the month,
the minimum temperature and the maximum temperature:

temps = data.frame(day=1:10, min = c(50.7,52.8,48.6,53.0,49.9,47.9,54.1,47.6,43.6,45.5), max = c(59.5,55.7,57.3,71.5,69.8,68.8,67.5,66.0,66.1,61.7))
class(temps)
head(temps)
head(temps,8)
tail(temps)
tail(temps,3)
temps$max
temps$min

# for loop example
# List the square of all the odd numbers in the range 1 and 100

sqr <- seq(1, 100, by=2)
squared = vector()
for (n in 1:50)
{
  squared[n] = sqr[n]^2
}
squared


#### mtcars data ####
# Alright..let's dive into some data!
# The R installation has a few datasets already built into it
# that you can play with. Right now, you'll load one of these,
# which is named mtcars.

# Run this next command to load the mtcars data.
data(mtcars)
# R has stored the mtcars data into a spreadsheet-like object
# called a data frame. Run the next command to see what variables
# are in the data set 
?mtcars

# Run the below one by one and see what happens
View(mtcars) # view the dataset in tabulated format in RStudio
str(mtcars) # shows the structure of the dataset
dim(mtcars) # number of rows and columns
head(mtcars) # first 6 observations of dataset
tail(mtcars) # last 6 rows of the dataset
names(mtcars) # display the column names
rownames(mtcars) # display the rownames

# basic subsetting

# First five observations of first column,
mtcars[c(1:5), 1]

# First five observations of mpg variable
mtcars[c(1:5), "mpg"]

# First five observations on all variables
mtcars[c(1:5), ]

# Let's examine our car data more closely. We can access an
# an individual variable (or column) from the data frame using
# the '$' sign. Run the code below to print out the variable
# miles per gallon. This is the mpg column in the data frame.

mtcars$mpg

# This is a vector containing the mpg (miles per gallon) of
# the 32 cars. Run this next line of code to get the average mpg for
# for all the cars. What is it?

mean(mtcars$mpg)

## Histogram - Univariate - one numeric variable
hist(mtcars$mpg, breaks=10, col="yellow", xlab="Miles Per Gallon", main="Histogram of Miles per Gallon")
abline(v=mean(mtcars$mpg), col = "red", lwd=4)
abline(v=median(mtcars$mpg), lwd=4)

# Summary Statistics
summary(mtcars$mpg)

# In 2013, the average mpg (miles per gallon) for a car was of order 23 mpg.
# Subset the data so that you create a new data frame that contains
# cars that get 23 or more mpg (miles per gallon). Save it to a new data
# frame called efficient.


efficient <- subset(mtcars, mpg > 23)
efficient

#Try Yourself
subset(mtcars, mpg > 30 & hp > 100)
subset(mtcars, mpg < 14 | disp > 390)

# How many cars get more than 23 mpg? 
nrow(efficient)

## Boxplot - Univariate - one numerical variable
boxplot(mtcars$mpg, col = "Green")
abline(h=mean(mtcars$mpg))

# two variable one numeric and other categorical (mpg and Transmission Type am)
boxplot(mpg ~ am, data=mtcars, col = c("green", "yellow"), main="mpg by transmission", xlab="Transmission type", ylab="Miles per gallon")
# mpg for cars with manual transmissions is better comparing with cars with automatic transmissions.

# Boxplot - mpg and type of cylinder
boxplot(mpg ~ cyl, data=mtcars, col = c("green", "yellow", "red"), main="mpg by transmission", xlab="Transmission type", ylab="Miles per gallon")
# 4 cyl models have a higher mpg as compared to 6 and 8 cylinder models

# Plot - univariate - one categorical variable
barplot(table(mtcars$cyl),col = "yellow",xlab ="Cylinder type", ylab="frequency")
barplot(table(mtcars$am))

# Try the below code to draw the boxplots in a row
par(mfrow=c(1,2))
boxplot(mpg ~ am, data=mtcars, col = c("green", "yellow"), main="mpg by transmission", xlab="Transmission type", ylab="Miles per gallon")
boxplot(mpg ~ cyl, data=mtcars, col = c("green", "yellow", "red"), main="mpg by number of cylinders", xlab="Transmission type", ylab="Miles per gallon")

# Scatterplot - 2 numeric variables
par(mfrow=c(1,1)) 
plot(x = mtcars$am, y = mtcars$mpg)

## Try yourself another numerical variable with mpg
plot(x = mtcars$wt, y = mtcars$mpg)
cor(mtcars$wt, mtcars$mpg)

plot(x = mtcars$qsec, y = mtcars$mpg)
cor(mtcars$qsec, mtcars$mpg)

## using the with function, you get similar results but this time you need not use dollar sign
with(mtcars, plot(wt, mpg))

mtcars$am     <- as.factor(mtcars$am)
mtcars$cyl    <- as.factor(mtcars$cyl)
mtcars$vs     <- as.factor(mtcars$vs)
mtcars$gear   <- as.factor(mtcars$gear)


## Linear model
fit <- lm(mpg ~ ., data=mtcars)
summary(fit)

## wt and hp only seems to be significantly correlated to mpg

model2 <- lm(mpg ~ hp + wt, data=mtcars)
summary(model2)


## Plotting parameters defined within plotting function : pch, lty, lwd, col, xlab, ylab, xlim, ylim, main 
## Global Plotting parameters : using par() mfrow, mfcol, mar, las, bg, oma
## Annotations to base plot : points(), text(), lines(), title(), axis(), legend()

## Base plotting
Starts with a plot function and add annotation functions
Drawback -  You cannot take away if any annotation is already plot. Restart from beginning

## Lattice (in lattice package)
# single plotting function only
# Specify a lot of information in a single function
# xyplot(), bwplot(), etc
# No annotation can be added after the plot is generated

## gglpot2 - grammar of graphics
# Add incremently + aesthetic done automatically like margins, spacing, paneling easy 
# mix of best of both base and lattice plotting systems
# gives more flexibility
# nice looking graphs
# defaults are pretty good but could be customized well

## Let us see another dataset iris

### read and write data ####
# read.table(), read.csv()
# write.table()
dat <- read.table("iris.txt") # iris.txt should be in the R working directory
dat
## Refer to the file iris.html and try yourself to explore the data in the iris dataset
# quick walkthrough of the iris.html file

write.table(dat, file="iris2.txt")
# list.files() to check for the file in working directory

