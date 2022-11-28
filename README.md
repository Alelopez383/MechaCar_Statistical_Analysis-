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

Although the number of significant variables, the multiple linear regression model outperformed the simple linear regression. According to the summary output, the r-squared value has increased from 0.10 -0.30 in the simple linear regression model (for each simple models) to 0.71 in our multiple model. But the lack of significant variables is evidence of overfitting. Overfitting means that the performance of a model performs well with a current dataset, but fails to generalize and predict future data correctly. Therefore, it doen´t predict the mpg or MechaCar prototypes effectively.

