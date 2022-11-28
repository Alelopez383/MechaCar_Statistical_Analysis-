# MechaCar_Statistical_Analysis-
Analizing the AutosRUs’ newest prototype, the MechaCar using Rstudio

# Objective
AutosRUs’ newest prototype, the MechaCar, is suffering from production troubles that are blocking the manufacturing team’s progress. So, it is neccessary to review the production data for insights that may help the manufacturing team. For that, we are going to 

 1. Perform multiple linear regression analysis to identify which variables in the dataset predict the mpg of MechaCar prototypes
 2. Collect summary statistics on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots
 3. Run t-tests to determine if the manufacturing lots are statistically different from the mean population
 4. Design a statistical study to compare vehicle performance of the MechaCar vehicles against vehicles from other manufacturers.

## 1. Identifying variables to predict the mpg of MechaCar prototypes

After running the multiple linear regression we had to determine which variables provide a significant contribution to the linear model, for that, we must look at the individual variable p-values (Pr(>|t|) value). Pr(>|t|) value represents the probability that each coefficient contributes a random amount of variance to the linear model. According to our results, vehicle length, an ground clearence are statistically unlikely to provide random amounts of variance to the linear model. In other words the vehicle length and ground clearence have a significant impact on the miles per gallon (mpg).

Although, the intercept it´s also very significative to our model because when an intercept is statistically significant, it means that the intercept term explains a significant amount of variability in the dependent variable when all independent vairables are equal to zero. So maybe we may need scaling or transforming the variables to help improve the predictive power of the model or add new ones to help the model.


```
Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
AWD              -3.411e+00  2.535e+00  -1.346   0.1852    

```
![image](https://user-images.githubusercontent.com/43974872/204197334-d132dd57-7e03-4526-b03b-5b2b1f9d4858.png)

Because the results shows that vehicle length and ground clearence are significative, we run simple linear regressions models to check the p-values.

For the variable *"vehicle_length"* the r-squared value is 0.37, which means that roughly 37% of the variablilty of our dependent variable (mpg) is explained using this linear model. And the p-value is 2.632 x 10-6, which is much smaller than our assumed significance level of 0.05%. Therefore, we can state that there is sufficient evidence to reject our null hypothesis, which means that the slope of our linear model is not zero.

```
lm(formula = mpg ~ vehicle_length, data = mechacar_table)

Residuals:
    Min      1Q  Median      3Q     Max 
-26.303  -7.160  -1.231   9.374  26.670 

Coefficients:
               Estimate Std. Error t value Pr(>|t|)    
(Intercept)    -25.0622    13.2960  -1.885   0.0655 .  
vehicle_length   4.6733     0.8774   5.326 2.63e-06 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 12.47 on 48 degrees of freedom
Multiple R-squared:  0.3715,	Adjusted R-squared:  0.3584 
F-statistic: 28.37 on 1 and 48 DF,  p-value: 2.632e-06

```
For the variable *"ground_clearance"* the r-squared value is 0.10, which means that only the 10% of the variablilty of our dependent variable (mpg) is explained using this linear model. And the p-value is 0.01975, which is smaller than our assumed significance level of 0.05%. Therefore, we can state that there is sufficient evidence to reject our null hypothesis, which means that the slope of our linear model is not zero.

```
lm(formula = mpg ~ ground_clearance, data = mechacar_table)

Residuals:
    Min      1Q  Median      3Q     Max 
-28.788  -9.990  -1.615   7.332  35.803 

Coefficients:
                 Estimate Std. Error t value Pr(>|t|)  
(Intercept)       19.4175    10.8662   1.787   0.0803 .
ground_clearance   2.0222     0.8385   2.412   0.0198 *
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 14.86 on 48 degrees of freedom
Multiple R-squared:  0.1081,	Adjusted R-squared:  0.08949 
F-statistic: 5.816 on 1 and 48 DF,  p-value: 0.01975

```


### Summary:

- Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset? 
  
  vehicle length and ground clearence
  
- Is the slope of the linear model considered to be zero? Why or why not?

 The p-value remained significant in the multiple linear regression because of the variables and the intercept remained significative, which means that the slope of our multiple linear model could be zero.

- Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?

Although the number of significant variables, the multiple linear regression model outperformed the simple linear regressions. According to the summary output, the r-squared value has increased from 0.10 -0.30 in the simple linear regressions models (for each simple models) to 0.71 in our multiple model. But the lack of significant variables is evidence of overfitting. Overfitting means that the performance of a model performs well with a current dataset, but fails to generalize and predict future data correctly. Therefore, it predicts effectively although it is not the ideal model.

 ## 2. Summary Statistics on Suspension Coils
 - Total Summary
 
 ![image](https://user-images.githubusercontent.com/43974872/204205808-e5410931-5918-4123-a8e7-93c9d7d37b3f.png)
 
 - Lot Summary 
 
![image](https://user-images.githubusercontent.com/43974872/204205855-76bcdfec-c41e-4f08-93ca-237f38b04808.png)

- Box Plot Total Summary

![total summary](https://user-images.githubusercontent.com/43974872/204208712-60a0c2d9-b2ac-4fa8-9608-ac6f5a8e9d6f.png)

- Box Plot Suspension by lot

![suspensio summary](https://user-images.githubusercontent.com/43974872/204208162-e0042f68-ea58-478a-8c25-fd40d00aefee.png)

The design specifications for the MechaCar suspension coils dictate that the **variance of the suspension coils must not exceed 100 pounds per square inch**. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?


If we look at the results of the total summary, we can see that there are too many outliers, however, the variance of the suspension coils is within the established limit (62.29356 < 100 pounds per square inch). But, when we observed by lot, we can see that the Lot 3 is not under the established limit, and even have more inconsistencies in general. So, the lots by themselves, only the Lot 3 is not meeting the design specifications for manufacture. 

## T-Tests on Suspension Coils
Now we want to determine if all manufacturing lots and each lot individually are statistically different from the population mean of 1,500 pounds per square inch.

### Total 
- Assuming our significance level of 0.05 percent, our p-value is slightly above the significance level. Therefore, we do not have sufficient evidence to reject the null hypothesis, and we would state that the two means are statistically similar.

![image](https://user-images.githubusercontent.com/43974872/204212918-965449dd-8d1a-4b56-b7f1-7e30b89e4201.png)

![total](https://user-images.githubusercontent.com/43974872/204212792-0884d952-9ea2-47ee-8d76-2420a9d81c46.png)

### Lot 1
- The p- value of Lot 1 is one; so that suggests no difference between the Lot 1 mean and the mean of the total lots (population). 

![image](https://user-images.githubusercontent.com/43974872/204212997-4e27216d-13b4-4bdd-bdb9-7b0f70ac9c79.png)

![lot 1](https://user-images.githubusercontent.com/43974872/204211565-714fc0ed-d7de-41b7-93bc-a4447e6c93aa.png)

### Lot 2
- The p-value is above the significance level (0.6072 > 0.05). Therefore, we do not have sufficient evidence to reject the null hypothesis, and we would state that the two means are statistically similar.

![image](https://user-images.githubusercontent.com/43974872/204213053-8d66c5ac-a2b9-42ca-94d7-c6e5788e3a8c.png)

![Lot 2](https://user-images.githubusercontent.com/43974872/204211697-26bdd30d-8d22-48c0-ba30-978d2d78be99.png)

### Lot 3
- The p-value is under the significance level (0.04168 < 0.05). Therefore, we have sufficient evidence to reject the null hypothesis and state that the two means are statistically different, so the mean of the Lot 3 is not similar at all to the mean of the population.

![image](https://user-images.githubusercontent.com/43974872/204213116-0aac777d-4a68-46ea-8d4f-0043cb3131b7.png)

 ![Lot 3](https://user-images.githubusercontent.com/43974872/204211856-d85adf2d-3cad-4aeb-ac74-b972c516d952.png)

##  Study Design: MechaCar vs Competition

In general, there are several factors when comparing a vehicle to the competition. The main factors for the final consumer are concentrated in the first place, cost - benefit, that is, whether the car is worth the sale price. Therefore, the necessary variables to carry out a study of the competition would be the sale price and the manufacturer's costs, since the price must be related to it. On the other hand, buyers are looking for safety and fuel economy. Lastly, aesthetic attributes of the vehicle, which will vary according to the price models of the vehicles and which will be the differentiators with respect to competing vehicles.

Therefore, we are going to do a Correlational research, which attempts to determine the extent of a relationship between two or more variables using statistical data. In this type of design, relationships between and among a number of facts are sought and interpreted. This type of research will recognize trends and patterns in data. 

- What metric or metrics are you going to test?
Variance and frequencies. Variance because we want to know how much variance in the dependent variable (safety) is accounted for in a linear combination of independent variables (prices, fuel economy, costs, number of vehicles sold). But also frequencies, because we want to know if there is a difference in categorical frequencies between groups (models of vehicles / competitors and number of vehicles sold)

- What is the null hypothesis or alternative hypothesis?
The null hypothesis, the vehicle performance (safety) is relevant for the consummer when they buy a car. 
Alternative hypothesis, safety is not relevant for the consumer when they buy a car.

- What statistical test would you use to test the hypothesis? And why?
Firt, test of normal distribution, to check that the data collected to analyze does not differ in the distribution of the observed data from what is expected if they came from a normal distribution with the same mean and standard deviation, and can be usable for statitstical models.
Then, I would run a contingency table, to see the correlations of the variables and to observed the relations between them, if there is any.
Then I would use a multiple linear regressión, to know if those variables can explain the dependent variable (safety).
An d a Chi-squared test to see the frequencies of the differents vehicle models.

- What data is needed to run the statistical test?
Sale price, number of vehicles sold, manufacturer´s costs, safety (we could use reports about manufacturer's fault car accidents, or the vehicles with the most reported failures in the market), aesthetic attributes that the consumer seeks in a vehicle (could be extracted by a survey), and fuel consumption by type/model of vehicle.
