# Delivery 1: Linear Regression to Predict MPG

#Installing packages and libraries
install.packages("tidyverse")
install.packages("jsonlite")
install.packages("readxl")
install.packages("ggplot2")

library(tidyverse)
library (jsonlite)
library(readxl)
library(ggplot2)
library(dplyr)

# Read MechaCar_mpg.csv
mechacar_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

head(mechacar_table)

# LINEAR REGRESSION
?lm()

# simple linear regression
summary(lm(mpg ~vehicle_length,data=mechacar_table))

# simple linear regression
summary(lm(mpg ~ground_clearance,data=mechacar_table))

# multiple linear regression 
lm(mpg ~vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar_table)

#generate summary statistics
summary(lm(mpg ~vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar_table))


#Deliverable 2: Create Visualizations for the Trip Analysis
suspension_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

?summarize()
total_summary <- suspension_table %>% summarize(Mean=mean(PSI),
                                                Median=median(PSI),
                                                Var=var(PSI),
                                                Std_Dev=sd(PSI),
                                                .groups = 'keep')

lot_summary <- suspension_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),
                                                                         Median=median(PSI),
                                                                         Var=var(PSI),
                                                                         Std_Dev=sd(PSI),
                                                                         .groups = 'keep')  

#Box plots with more than one
plt <- ggplot(suspension_table,aes(x=Manufacturing_Lot ,y=PSI)) #import dataset into ggplot2
plt + geom_boxplot(fill = "white", colour = "#3366FF", outlier.colour = "red", outlier.shape = 1)

plt <- ggplot(suspension_table,aes(y=PSI)) #import dataset into ggplot2
plt + geom_boxplot()

#Deliverable 3: T-Tests on Suspension Coils
?t.test()

t.test(suspension_table$PSI,mu=1500)
plt <- ggplot(suspension_table,aes(x=PSI)) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

# t-test by lot
lot1 <- subset(suspension_table, Manufacturing_Lot=="Lot1")
t.test(lot1$PSI,mu=1500)

plt <- ggplot(lot1,aes(x=PSI)) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

lot2 <- subset(suspension_table, Manufacturing_Lot=="Lot2")
t.test(lot2$PSI,mu=1500)

plt <- ggplot(lot2,aes(x=PSI)) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot


lot3 <- subset(suspension_table, Manufacturing_Lot=="Lot3")
t.test(lot3$PSI,mu=1500)

plt <- ggplot(lot3,aes(x=PSI)) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot
