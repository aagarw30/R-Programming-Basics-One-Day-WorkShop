## Exploring the diamonds dataset 
### how the weight in carats or colour or clarity affect the price of diamonds?

## We will use ggplot for visualization
library(ggplot2) # load the dataset, ensure ggplot is already installed

?diamonds # help on diamonds dataset

data(diamonds) # load the dataset

View(diamonds) # see the observations of dataset in tabulated format

str(diamonds) # structure of the dataset

# The output above tells us that there are 53,940 observations and 10 variables 
# in the dataset. The variable name are listed, along with their type and the 
# first few observations of each variable. 
# Note: R calls categorical variables factors.

# Exploring single numerical variable
summary(diamonds)

# Analyzing single numerical variable
summary(diamonds$price)

range ?

mean?

min?

max?

## Plot the histogram of price
ggplot(data=diamonds, aes(x=price)) + geom_histogram()

ggplot(data=diamonds, aes(x=price)) + geom_histogram(binwidth = 1000)
# try with different BINs 1500, 2000, 2500 etc...

ggplot(data=diamonds, aes(x=price)) + geom_histogram(binwidth = 2500)

# What does the histogram tells you?
# Histogram is Right skewed

## Try yourself the histogram of any other numerical variable in dataset
p <- ggplot(diamonds, aes(x=clarity)) + geom_histogram(aes(fill=cut))
p

# Saving the plots
ggsave(filename="diamonds.png", p)
ggsave(filename="diamonds.pdf", p)
ggsave(filename="diamonds.jpeg", p)

# What type of variable is color?
table(diamonds$color)

## Boxplots
ggplot(diamonds) + geom_boxplot(aes(x = cut, y = price))
ggplot(diamonds) + geom_boxplot(aes(x = color, y = price))

## Scatterplot
ggplot(diamonds, aes(x=carat, y = price)) + geom_point()
# As one would expect, 
# the price increases sharply as the size of the diamond increases. 

# relationship of price with other variables such as carat and color
ggplot(diamonds, aes(x=carat, y = price)) + geom_point() + facet_wrap(~color)
ggplot(diamonds, aes(x=carat, y = price)) + geom_point() + facet_wrap(~clarity)
ggplot(diamonds, aes(x=carat, y = price)) + geom_point() + facet_wrap(clarity~color) 

fit1=lm(price~., data=diamonds)
summary(fit1)