# Set working directory
> setwd("/Users/hamzazidan/Downloads/LSE_DA301_assignment_files (1)")
> 
> # Import turtle_sales.csv
> turtle_sales <- read.csv("turtle_sales.csv")
> 
> # Import required libraries
> library(dplyr)

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

> library(ggplot2)
> 
> # View the first 10 rows of the data
> head(turtle_sales, 10)
   Ranking Product Platform Year        Genre Publisher NA_Sales EU_Sales Global_Sales
1        1     107      Wii 2006       Sports  Nintendo    34.02    23.80        67.85
2        2     123      NES 1985     Platform  Nintendo    23.85     2.94        33.00
3        3     195      Wii 2008       Racing  Nintendo    13.00    10.56        29.37
4        4     231      Wii 2009       Sports  Nintendo    12.92     9.03        27.06
5        5     249       GB 1996 Role-Playing  Nintendo     9.24     7.29        25.72
6        6     254       GB 1989       Puzzle  Nintendo    19.02     1.85        24.81
7        7     263       DS 2006     Platform  Nintendo     9.33     7.57        24.61
8        8     283      Wii 2006         Misc  Nintendo    11.50     7.54        23.80
9        9     291      Wii 2009     Platform  Nintendo    11.96     5.79        23.47
10      10     326      NES 1984      Shooter  Nintendo    22.08     0.52        23.21
> 
> # Explore the data
> str(turtle_sales)
'data.frame':	352 obs. of  9 variables:
 $ Ranking     : int  1 2 3 4 5 6 7 8 9 10 ...
 $ Product     : int  107 123 195 231 249 254 263 283 291 326 ...
 $ Platform    : chr  "Wii" "NES" "Wii" "Wii" ...
 $ Year        : num  2006 1985 2008 2009 1996 ...
 $ Genre       : chr  "Sports" "Platform" "Racing" "Sports" ...
 $ Publisher   : chr  "Nintendo" "Nintendo" "Nintendo" "Nintendo" ...
 $ NA_Sales    : num  34.02 23.85 13 12.92 9.24 ...
 $ EU_Sales    : num  23.8 2.94 10.56 9.03 7.29 ...
 $ Global_Sales: num  67.8 33 29.4 27.1 25.7 ...
> summary(turtle_sales)
    Ranking            Product       Platform              Year         Genre            Publisher        
 Min.   :    1.00   Min.   : 107   Length:352         Min.   :1982   Length:352         Length:352        
 1st Qu.:   88.75   1st Qu.:1945   Class :character   1st Qu.:2003   Class :character   Class :character  
 Median :  176.50   Median :3340   Mode  :character   Median :2009   Mode  :character   Mode  :character  
 Mean   : 1428.02   Mean   :3607                      Mean   :2007                                        
 3rd Qu.: 1439.75   3rd Qu.:5436                      3rd Qu.:2012                                        
 Max.   :16096.00   Max.   :9080                      Max.   :2016                                        
                                                      NA's   :2                                           
    NA_Sales          EU_Sales       Global_Sales   
 Min.   : 0.0000   Min.   : 0.000   Min.   : 0.010  
 1st Qu.: 0.4775   1st Qu.: 0.390   1st Qu.: 1.115  
 Median : 1.8200   Median : 1.170   Median : 4.320  
 Mean   : 2.5160   Mean   : 1.644   Mean   : 5.335  
 3rd Qu.: 3.1250   3rd Qu.: 2.160   3rd Qu.: 6.435  
 Max.   :34.0200   Max.   :23.800   Max.   :67.850  
                                                    
> 
> # Create a subset of the data frame
> sales_data <- select(turtle_sales, -Ranking, -Year, -Genre, -Publisher)
> 
> # Summary of the new data frame
> summary(sales_data)
    Product       Platform            NA_Sales          EU_Sales       Global_Sales   
 Min.   : 107   Length:352         Min.   : 0.0000   Min.   : 0.000   Min.   : 0.010  
 1st Qu.:1945   Class :character   1st Qu.: 0.4775   1st Qu.: 0.390   1st Qu.: 1.115  
 Median :3340   Mode  :character   Median : 1.8200   Median : 1.170   Median : 4.320  
 Mean   :3607                      Mean   : 2.5160   Mean   : 1.644   Mean   : 5.335  
 3rd Qu.:5436                      3rd Qu.: 3.1250   3rd Qu.: 2.160   3rd Qu.: 6.435  
 Max.   :9080                      Max.   :34.0200   Max.   :23.800   Max.   :67.850  
> 
> # Create scatterplot of NA_Sales vs. EU_Sales
> ggplot(sales_data, aes(x = NA_Sales, y = EU_Sales)) + 
+     geom_point()
> 
> # Create histogram of Global_Sales
> ggplot(sales_data, aes(x = Global_Sales)) + 
+     geom_histogram()
`stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
> 
> # Create boxplot of NA_Sales, EU_Sales, and Global_Sales
> ggplot(sales_data, aes(x = "", y = NA_Sales)) + 
+     geom_boxplot() +
+     labs(title = "NA_Sales Boxplot")
> 
> ggplot(sales_data, aes(x = "", y = EU_Sales)) + 
+     geom_boxplot() +
+     labs(title = "EU_Sales Boxplot")
> 
> ggplot(sales_data, aes(x = "", y = Global_Sales)) + 
+     geom_boxplot() +
+     labs(title = "Global_Sales Boxplot")
> 
> # From the exploratory data analysis of the turtle sales data, some insights and observations can be made. Firstly, the scatterplot indicates a positive correlation between NA_Sales and EU_Sales, suggesting that sales in one region may affect sales in another region. Secondly, the histogram of Global_Sales shows that the distribution is right-skewed, indicating that a few games had very high sales. Finally, the boxplot shows some outliers in NA_Sales, EU_Sales, and Global_Sales, which could be due to factors such as a game's popularity or release date.
> 
> # Exploring the data further, it would be interesting to investigate the relationship between Platform and Sales, as well as the effect of the genre on sales. It would also be useful to perform a regression analysis to determine which factors most strongly affect sales. Overall, these insights can be used to inform business decisions such as targeting specific regions for marketing or focusing on certain types of games that have high sales potential.

mean(sales_data$NA_Sales, trim = 0.05)
[1] 2.060912
> mean(sales_data$EU_Sales, trim = 0.05)
[1] 1.391038
> mean(sales_data$Global_Sales, trim = 0.05)
[1] 4.537673
> 
> 
> summary(sales_data)
    Product       Platform            NA_Sales          EU_Sales       Global_Sales   
 Min.   : 107   Length:352         Min.   : 0.0000   Min.   : 0.000   Min.   : 0.010  
 1st Qu.:1945   Class :character   1st Qu.: 0.4775   1st Qu.: 0.390   1st Qu.: 1.115  
 Median :3340   Mode  :character   Median : 1.8200   Median : 1.170   Median : 4.320  
 Mean   :3607                      Mean   : 2.5160   Mean   : 1.644   Mean   : 5.335  
 3rd Qu.:5436                      3rd Qu.: 3.1250   3rd Qu.: 2.160   3rd Qu.: 6.435  
 Max.   :9080                      Max.   :34.0200   Max.   :23.800   Max.   :67.850  
> 
> sales_per_product <- sales_data %>% 
+     group_by(Product) %>% 
+     summarise(NA_Sales = sum(NA_Sales), EU_Sales = sum(EU_Sales), Global_Sales = sum(Global_Sales))
> 
> summary(sales_per_product)
    Product        NA_Sales         EU_Sales       Global_Sales   
 Min.   : 107   Min.   : 0.060   Min.   : 0.000   Min.   : 4.200  
 1st Qu.:1468   1st Qu.: 2.495   1st Qu.: 1.460   1st Qu.: 5.515  
 Median :3158   Median : 3.610   Median : 2.300   Median : 8.090  
 Mean   :3490   Mean   : 5.061   Mean   : 3.306   Mean   :10.730  
 3rd Qu.:5442   3rd Qu.: 5.570   3rd Qu.: 4.025   3rd Qu.:12.785  
 Max.   :9080   Max.   :34.020   Max.   :23.800   Max.   :67.850  
> 
> plot(sales_data$NA_Sales, sales_data$EU_Sales,
+      xlab = "NA_Sales",
+      ylab = "EU_Sales",
+      main = "NA_Sales vs. EU_Sales")
> 
> plot(sales_data$Global_Sales, sales_data$EU_Sales,
+      xlab = "Global_Sales",
+      ylab = "EU_Sales",
+      main = "Global_Sales vs. EU_Sales")
> 
> hist(sales_data$NA_Sales,
+      main = "Histogram of NA_Sales",
+      xlab = "NA_Sales")
> 
> hist(sales_data$Global_Sales,
+      main = "Histogram of Global_Sales",
+      xlab = "Global_Sales")
> 
> boxplot(sales_data[, c("NA_Sales", "EU_Sales", "Global_Sales")],
+         main = "Boxplot of Sales Data",
+         xlab = c("NA_Sales", "EU_Sales", "Global_Sales"),
+         ylab = "Sales")
> 
> qqnorm(sales_data$NA_Sales)
> qqline(sales_data$NA_Sales)
> 
> qqnorm(sales_data$EU_Sales)
> qqline(sales_data$EU_Sales)
> 
> qqnorm(sales_data$Global_Sales)
> qqline(sales_data$Global_Sales)
> 
> shapiro.test(sales_data$NA_Sales)

	Shapiro-Wilk normality test

data:  sales_data$NA_Sales
W = 0.6293, p-value < 2.2e-16

> shapiro.test(sales_data$EU_Sales)

	Shapiro-Wilk normality test

data:  sales_data$EU_Sales
W = 0.64687, p-value < 2.2e-16

> shapiro.test(sales_data$Global_Sales)

	Shapiro-Wilk normality test

data:  sales_data$Global_Sales
W = 0.6818, p-value < 2.2e-16

> 
> library(moments)
> 
> skewness(sales_data$NA_Sales)
[1] 4.30921
> skewness(sales_data$EU_Sales)
[1] 4.818688
> skewness(sales_data$Global_Sales)
[1] 4.045582
> 
> kurtosis(sales_data$NA_Sales)
[1] 31.36852
> kurtosis(sales_data$EU_Sales)
[1] 44.68924
> kurtosis(sales_data$Global_Sales)
[1] 32.63966
> 
> cor(sales_data[, c("NA_Sales", "EU_Sales", "Global_Sales")])
              NA_Sales  EU_Sales Global_Sales
NA_Sales     1.0000000 0.7055236    0.9349455
EU_Sales     0.7055236 1.0000000    0.8775575
Global_Sales 0.9349455 0.8775575    1.0000000
> 
> plot(sales_data$NA_Sales, sales_data$EU_Sales, xlab = "NA_Sales", ylab = "EU_Sales")
> abline(lm(sales_data$EU_Sales ~ sales_data$NA_Sales), col = "red")
> 
> plot(sales_data$NA_Sales, sales_data$Global_Sales, xlab = "NA_Sales", y
library(ggplot2)
> 
> ggplot(sales_data, aes(x = NA_Sales, y = EU_Sales)) +
+     geom_point() +
+     geom_smooth(method = "lm") +
+     labs(title = "NA Sales vs. EU Sales", x = "NA Sales", y = "EU Sales")
`geom_smooth()` using formula = 'y ~ x'
> 
> ggplot(sales_data, aes(x = NA_Sales, y = Global_Sales)) +
+     geom_point() +
+     geom_smooth(method = "lm") +
+     labs(title = "NA Sales vs. Global Sales", x = "NA Sales", y = "Global Sales")
`geom_smooth()` using formula = 'y ~ x'
> 
> ggplot(sales_data, aes(x = EU_Sales, y = Global_Sales)) +
+     geom_point() +
+     geom_smooth(method = "lm") +
+     labs(title = "EU Sales vs. Global Sales", x = "EU Sales", y = "Global Sales")
`geom_smooth()` using formula = 'y ~ x'
> 
> # In this analysis, we explored the sales data for various video game products across different regions. We started by checking the basic statistics of the sales data, which included minimum, maximum, and mean values of each column. It was found that the mean values of all three regions were different, with the NA region having the highest mean value and the EU region having the second-highest mean value.
> 
> # Next, we created scatter plots, histograms, and boxplots to visualize the sales data. From these plots, we observed that the sales data was highly skewed, with many outliers present in each region's data. Then, we performed the Shapiro-Wilk test to determine the normality of the sales data. The p-values for all three regions' data were less than 0.05, indicating that the sales data was not normally distributed.
> 
> # We also calculated the skewness and kurtosis values for each region's sales data, which further confirmed the highly skewed nature of the data. Additionally, we checked for correlations between the sales data columns and found that all three columns had a high correlation.
> 
> # In conclusion, this analysis revealed that the sales data was highly skewed and not normally distributed, which is a common characteristic of sales data. Further investigation could be done to explore the factors contributing to this skewedness and to identify potential outliers or anomalies in the data. Additionally, we could perform regression analysis to predict future sales based on the current sales data.
> 
> simple_lm <- lm(Global_Sales ~ NA_Sales, data = sales_data)
> 
> # Print the model summary
> summary(simple_lm)

Call:
lm(formula = Global_Sales ~ NA_Sales, data = sales_data)

Residuals:
     Min       1Q   Median       3Q      Max 
-15.7352  -1.0341  -0.5555   0.6247   8.8676 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  1.01232    0.14752   6.862 3.09e-11 ***
NA_Sales     1.71797    0.03485  49.300  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.226 on 350 degrees of freedom
Multiple R-squared:  0.8741,	Adjusted R-squared:  0.8738 
F-statistic:  2430 on 1 and 350 DF,  p-value: < 2.2e-16

> 
> 
> multiple_lm <- lm(Global_Sales ~ ., data = sales_data[, -c(1, 2)])
> 
> summary(multiple_lm)

Call:
lm(formula = Global_Sales ~ ., data = sales_data[, -c(1, 2)])

Residuals:
    Min      1Q  Median      3Q     Max 
-3.6186 -0.4234 -0.2692  0.0796  7.4639 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  0.22175    0.07760   2.858  0.00453 ** 
NA_Sales     1.15543    0.02456  47.047  < 2e-16 ***
EU_Sales     1.34197    0.04134  32.466  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.112 on 349 degrees of freedom
Multiple R-squared:  0.9687,	Adjusted R-squared:  0.9685 
F-statistic:  5398 on 2 and 349 DF,  p-value: < 2.2e-16

> 
> 
> new_data <- data.frame(NA_Sales = c(34.02, 3.93, 2.73, 2.26, 22.08),
+                        EU_Sales = c(23.80, 1.56, 0.65, 0.97, 0.52))
> predictions <- predict(multiple_lm, newdata = new_data)
> 
> 
> predictions
        1         2         3         4         5 
71.468572  6.856083  4.248367  4.134744 26.431567 
