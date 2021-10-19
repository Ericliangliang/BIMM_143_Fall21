#' ---
#' title: "Class 05 Data Visualization"
#' author: "Bangyan Hu (PID: A15540189)"
#' date: "Oct 12, 2021"
#' ---

#Lets start with a scatterplot
#Before we can use it we need to load it up!
# > install.packages("ggplot2")
# > library("ggplot2")
library(ggplot2)

#Every ggplot has a data + aes + geoms
ggplot(data=cars) + 
  aes(x=speed, y=dist) +
  geom_point()

ggplot(data=cars) + 
  aes(x=speed, y=dist) +
  geom_point() +
  geom_smooth()

# Change to a linear model
p <- ggplot(data=cars) + 
  aes(x=speed, y=dist) +
  geom_point() +
  geom_smooth(method="lm")

p + labs(title="My nice plot",
         x="Speed (MPH)")

#Base graphics is shorter
plot(cars)


#Lets try a more complicated data set of gene expression
#First read the dataset
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)

#Q. How many genes
nrow(genes)

#Q. How many columns
colnames(genes)
ncol(genes)

#Q. How to access State col
table( genes$State )

#Q. what % are up/down (2 significant figures)
prec <- table( genes$State ) / nrow(genes) * 100
round( prec, 2 )

# Time to plot
ggplot(genes) + 
  aes(x=Condition1, y=Condition2, col=State) +
  geom_point()

# Polish the plot
Pg <- ggplot(genes) + 
  aes(x=Condition1, y=Condition2, col=State) +
  geom_point()

Pg + scale_colour_manual ( values=c("blue","gray","red") ) + 
  labs(title="Gene Expression Changes Upon Drug Treatment",
       x="Control (no drug)", 
       y="Drug Treatment")










