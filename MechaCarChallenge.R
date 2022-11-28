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
