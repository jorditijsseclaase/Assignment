
R version 3.5.2 (2018-12-20) -- "Eggshell Igloo"
Copyright (C) 2018 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin15.6.0 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> #Clean environment
  > rm(list=ls())
> 
  > 
  > library(tidyverse)
── Attaching packages ───────────────────────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──
✔ ggplot2 3.1.0       ✔ purrr   0.3.2  
✔ tibble  2.1.1       ✔ dplyr   0.8.0.1
✔ tidyr   0.8.3       ✔ stringr 1.4.0  
✔ readr   1.3.1       ✔ forcats 0.4.0  
── Conflicts ──────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
> library(XML)
> require(XML)
> library(writexl)
> library("readxl")
> library(dplyr)
> library(lubridate)

Attaching package: ‘lubridate’

The following object is masked from ‘package:base’:
  
  date

> 
  > library(mgcv)
Loading required package: nlme

Attaching package: ‘nlme’

The following object is masked from ‘package:dplyr’:
  
  collapse

This is mgcv 1.8-28. For overview type 'help("mgcv-package")'.
> 
  > Total <- read_excel("NN.xlsx")
>                                                                                                                       
  > Total$Avg_Max_NO2 <- as.numeric(Total$Avg_Max_NO2)
> mod1 = gam(Avg_Max_NO2~Avg_Streak+s(DayNr, k=40, bs="ps"), data=Total)
Error in gam.fit(G, family = G$family, control = control, gamma = gamma,  : 
                   iterative weights or data non-finite in gam.fit - regularization may help. See ?gam.control.
                 > summary(mod1)
                 Error in summary(mod1) : object 'mod1' not found
                 > plot(mod1)
                 Error in plot(mod1) : object 'mod1' not found
                 > mod1 = gam(Avg_Max_NO2~Avg_Streak+s(DayNr, k=20, bs="ps"), data=Total)
                 Error in gam.fit(G, family = G$family, control = control, gamma = gamma,  : 
                                    iterative weights or data non-finite in gam.fit - regularization may help. See ?gam.control.
                                  > summary(Total$DayNr)
                                  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
                                  1.0    92.0   183.0   183.1   274.0   366.0 
                                  > summary(Total$Avg_Max_NO2)
                                  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
                                  -Inf   59.12   77.71    -Inf  102.46  214.38 
                                  > Total <- read_excel("NN.xlsx")
                                  
                                  > View(Total)
                                  > Total <- Total %>% filter(Avg_Max_NO2>0)
                                  > mod1 = gam(Avg_Max_NO2~Avg_Streak+s(DayNr, k=40, bs="ps"), data=Total)
                                  Error in y - mu : non-numeric argument to binary operator
                                  > Total$Avg_Max_NO2 <- as.numeric(Total$Avg_Max_NO2)
                                  > mod1 = gam(Avg_Max_NO2~Avg_Streak+s(DayNr, k=40, bs="ps"), data=Total)
                                  > summary(mod1)
                                  
                                  Family: gaussian 
                                  Link function: identity 
                                  
                                  Formula:
                                    Avg_Max_NO2 ~ Avg_Streak + s(DayNr, k = 40, bs = "ps")
                                  
                                  Parametric coefficients:
                                    Estimate Std. Error t value Pr(>|t|)    
                                  (Intercept) 114.0272     1.2092   94.30   <2e-16 ***
                                    Avg_Streak   -4.7441     0.1633  -29.06   <2e-16 ***
                                    ---
                                    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                  
                                  Approximate significance of smooth terms:
                                    edf Ref.df     F p-value    
                                  s(DayNr) 13.63  16.56 17.04  <2e-16 ***
                                    ---
                                    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                  
                                  R-sq.(adj) =  0.396   Deviance explained =   40%
                                  GCV = 682.56  Scale est. = 677.68    n = 2185
                                  > plot(mod1)
                                  > a = tapply(Total$Avg_Max_NO2,factor(Total$DayNr),mean)
                                  > plot(unique(Total$DayNr),a)
                                  > plot(unique(Total$DayNr),a,type="l")
                                  > mod1 = gam(Avg_Max_NO2~Avg_Streak+s(DayNr, k=40, bs="ps")+s(1:nrow(Total), k=20, bs="ps"), data=Total)
                                  Show Traceback
                                  
                                  Rerun with Debug
                                  Error in term[i] <- attr(terms(reformulate(term[i])), "term.labels") : 
                                    replacement has length zero 
                                  
                                  > mod1 = gam(Avg_Max_NO2~Avg_Streak+s(DayNr, k=40, bs="ps")+s(1:nrow(Total), k=20, bs="ps"), data=Total)
                                  Show Traceback
                                  
                                  Rerun with Debug
                                  Error in term[i] <- attr(terms(reformulate(term[i])), "term.labels") : 
                                    replacement has length zero 
                                  
                                  > b = 1:nrow(Total)
                                  > mod1 = gam(Avg_Max_NO2~Avg_Streak+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps"), data=Total)
                                  > plot(mod1)
                                  Hit <Return> to see next plot: 
                                    > mod1 = gam(Avg_Max_NO2~Avg_Streak+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, k=20, bs="ps"), data=Total)
                                  > plt(mod1)
                                  Error in plt(mod1) : could not find function "plt"
                                  > plot(mod1)
                                  Hit <Return> to see next plot: 
                                    Hit <Return> to see next plot: 
                                    > summary(mod1)
                                  
                                  Family: gaussian 
                                  Link function: identity 
                                  
                                  Formula:
                                    Avg_Max_NO2 ~ Avg_Streak + s(DayNr, k = 40, bs = "ps") + s(b, 
                                                                                               k = 20, bs = "ps") + s(T_max, k = 20, bs = "ps")
                                  
                                  Parametric coefficients:
                                    Estimate Std. Error t value Pr(>|t|)    
                                  (Intercept) 110.7045     1.0961  101.00   <2e-16 ***
                                    Avg_Streak   -4.2385     0.1491  -28.43   <2e-16 ***
                                    ---
                                    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                  
                                  Approximate significance of smooth terms:
                                    edf Ref.df      F  p-value    
                                  s(DayNr) 14.167 17.206 17.576  < 2e-16 ***
                                    s(b)     14.868 16.000  4.219 3.68e-08 ***
                                    s(T_max)  4.109  5.168 98.020  < 2e-16 ***
                                    ---
                                    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                  
                                  R-sq.(adj) =  0.531   Deviance explained = 53.9%
                                  GCV = 534.56  Scale est. = 525.96    n = 2183
                                  > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, k=20, bs="ps"), data=Total)
                                  > plot(mod1)
                                  Hit <Return> to see next plot: 
                                    Hit <Return> to see next plot: 
                                    Hit <Return> to see next plot: 
                                    > 
                                    > summary(mod1)
                                  
                                  Family: gaussian 
                                  Link function: identity 
                                  
                                  Formula:
                                    Avg_Max_NO2 ~ s(Avg_Streak, k = 20, bs = "ps") + s(DayNr, k = 40, 
                                                                                       bs = "ps") + s(b, k = 20, bs = "ps") + s(T_max, k = 20, bs = "ps")
                                  
                                  Parametric coefficients:
                                    Estimate Std. Error t value Pr(>|t|)    
                                  (Intercept)  82.8407     0.4858   170.5   <2e-16 ***
                                    ---
                                    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                  
                                  Approximate significance of smooth terms:
                                    edf Ref.df      F  p-value    
                                  s(Avg_Streak)  9.903 11.606 75.497  < 2e-16 ***
                                    s(DayNr)      13.882 16.874 17.595  < 2e-16 ***
                                    s(b)          14.773 15.915  4.526 6.65e-09 ***
                                    s(T_max)       4.224  5.304 96.794  < 2e-16 ***
                                    ---
                                    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                  
                                  R-sq.(adj) =  0.541   Deviance explained =   55%
                                  GCV =  525.7  Scale est. = 515.16    n = 2183
                                  > mod1$aic
                                  [1] 19872.12
                                  > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+T_max, data=Total)
                                  > mod1$aic
                                  [1] 19880.66
                                  > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+T_max, data=Total)
                                  > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, k=20, bs="ps"), data=Total)
                                  > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, k=20, bs="ps")+Rain, data=Total)
                                  > summary(mod1)
                                  
                                  Family: gaussian 
                                  Link function: identity 
                                  
                                  Formula:
                                    Avg_Max_NO2 ~ s(Avg_Streak, k = 20, bs = "ps") + s(DayNr, k = 40, 
                                                                                       bs = "ps") + s(b, k = 20, bs = "ps") + s(T_max, k = 20, bs = "ps") + 
                                    Rain
                                  
                                  Parametric coefficients:
                                    Estimate Std. Error t value Pr(>|t|)    
                                  (Intercept)  85.1518     0.5654 150.606  < 2e-16 ***
                                    Rain         -9.9511     1.2900  -7.714 1.86e-14 ***
                                    ---
                                    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                  
                                  Approximate significance of smooth terms:
                                    edf Ref.df      F  p-value    
                                  s(Avg_Streak)  9.419 11.105 76.668  < 2e-16 ***
                                    s(DayNr)      13.870 16.863 17.233  < 2e-16 ***
                                    s(b)          14.582 15.749  3.966 2.26e-07 ***
                                    s(T_max)       4.756  5.934 66.354  < 2e-16 ***
                                    ---
                                    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                  
                                  R-sq.(adj) =  0.553   Deviance explained = 56.2%
                                  GCV = 512.37  Scale est. = 501.89    n = 2183
                                  > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, by=Rain, k=20, bs="ps")+Rain, data=Total)
                                  > summary(mod1)
                                  
                                  Family: gaussian 
                                  Link function: identity 
                                  
                                  Formula:
                                    Avg_Max_NO2 ~ s(Avg_Streak, k = 20, bs = "ps") + s(DayNr, k = 40, 
                                                                                       bs = "ps") + s(b, k = 20, bs = "ps") + s(T_max, by = Rain, 
                                                                                                                                k = 20, bs = "ps") + Rain
                                  
                                  Parametric coefficients:
                                    Estimate Std. Error t value Pr(>|t|)    
                                  (Intercept)   86.860      0.602 144.279  < 2e-16 ***
                                    Rain         -11.511      1.800  -6.394 1.98e-10 ***
                                    ---
                                    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                  
                                  Approximate significance of smooth terms:
                                    edf Ref.df      F  p-value    
                                  s(Avg_Streak)  9.961 11.665 71.460  < 2e-16 ***
                                    s(DayNr)      13.635 16.572  4.237 2.21e-08 ***
                                    s(b)          15.017 16.136  4.065 4.24e-07 ***
                                    s(T_max):Rain  1.711  2.131 10.912 1.58e-05 ***
                                    ---
                                    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                  
                                  Rank: 98/99
                                  R-sq.(adj) =  0.476   Deviance explained = 48.6%
                                  GCV = 600.09  Scale est. = 588.47    n = 2183
                                  > plot(mod1)
                                  Hit <Return> to see next plot: 
                                    Hit <Return> to see next plot: 
                                    Hit <Return> to see next plot: 
                                    > ?s
                                  > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, by=factor(Rain), k=20, bs="ps")+factor(Rain), data=Total)
                                  > summary(mod1)
                                  
                                  Family: gaussian 
                                  Link function: identity 
                                  
                                  Formula:
                                    Avg_Max_NO2 ~ s(Avg_Streak, k = 20, bs = "ps") + s(DayNr, k = 40, 
                                                                                       bs = "ps") + s(b, k = 20, bs = "ps") + s(T_max, by = factor(Rain), 
                                                                                                                                k = 20, bs = "ps") + factor(Rain)
                                  
                                  Parametric coefficients:
                                    Estimate Std. Error t value Pr(>|t|)    
                                  (Intercept)    85.2551     0.5666 150.474  < 2e-16 ***
                                    factor(Rain)1  -9.1468     1.4628  -6.253 4.85e-10 ***
                                    ---
                                    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                  
                                  Approximate significance of smooth terms:
                                    edf Ref.df      F  p-value    
                                  s(Avg_Streak)           9.292 10.971 76.853  < 2e-16 ***
                                    s(DayNr)               13.848 16.839 16.626  < 2e-16 ***
                                    s(b)                   14.606 15.770  3.911 3.12e-07 ***
                                    s(T_max):factor(Rain)0  6.033  7.417 51.591  < 2e-16 ***
                                    s(T_max):factor(Rain)1  2.307  2.914 69.086  < 2e-16 ***
                                    ---
                                    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                  
                                  R-sq.(adj) =  0.555   Deviance explained = 56.4%
                                  GCV = 511.05  Scale est. = 499.79    n = 2183
                                  > plot(mod1)
                                  Hit <Return> to see next plot: 
                                    Hit <Return> to see next plot: 
                                    Hit <Return> to see next plot: 
                                    Hit <Return> to see next plot: 
                                    > mod1$aic
                                  [1] 19810.22
                                  > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, k=20, bs="ps")+Rain, data=Total)
                                  > mod1$aic
                                  [1] 19815.99
                                  > colnames(Total)
                                  [1] "DayNr"                    "Month"                   
                                  [3] "Daytype"                  "Season"                  
                                  [5] "Holiday"                  "T_max"                   
                                  [7] "T_min"                    "Avg_T"                   
                                  [9] "Streak_max"               "Rain_ml"                 
                                  [11] "Rain"                     "Days_last_rain"          
                                  [13] "Avg_Streak"               "avg_tr_dist"             
                                  [15] "avg_tr_time"              "users_Street30"          
                                  [17] "Vehicles_Km_Branches"     "Vehicles_Km_Total"       
                                  [19] "avg_Speed"                "Avg_Max_NO2"             
                                  [21] "Max_NO2"                  "Max_NO2_station"         
                                  [23] "num_stations_NO2_max_50"  "num_stations_NO2_50_100" 
                                  [25] "num_stations_NO2_100_180" "num_stations_NO2_180_200"
                                  [27] "num_stations_NO2_200_400" "num_stations_NO2_min_400"
                                  > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, k=20, bs="ps")+Rain+s(Days_last_rain, k=20, bs="ps"), data=Total)
                                  > summary(mod1)
                                  
                                  Family: gaussian 
                                  Link function: identity 
                                  
                                  Formula:
                                    Avg_Max_NO2 ~ s(Avg_Streak, k = 20, bs = "ps") + s(DayNr, k = 40, 
                                                                                       bs = "ps") + s(b, k = 20, bs = "ps") + s(T_max, k = 20, bs = "ps") + 
                                    Rain + s(Days_last_rain, k = 20, bs = "ps")
                                  
                                  Parametric coefficients:
                                    Estimate Std. Error t value Pr(>|t|)    
                                  (Intercept)  83.4101     0.6797 122.711   <2e-16 ***
                                    Rain         -2.4517     2.0900  -1.173    0.241    
                                  ---
                                    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                  
                                  Approximate significance of smooth terms:
                                    edf Ref.df      F  p-value    
                                  s(Avg_Streak)      9.080 10.747 74.720  < 2e-16 ***
                                    s(DayNr)          13.740 16.725 15.259  < 2e-16 ***
                                    s(b)              14.522 15.695  3.525 3.51e-06 ***
                                    s(T_max)           4.916  6.123 49.476  < 2e-16 ***
                                    s(Days_last_rain)  8.134  9.728  3.858 4.39e-05 ***
                                    ---
                                    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                  
                                  R-sq.(adj) =   0.56   Deviance explained =   57%
                                  GCV = 506.43  Scale est. = 494.28    n = 2183
                                  > plot(mod1)
                                  Hit <Return> to see next plot: 
                                    Hit <Return> to see next plot: 
                                    Hit <Return> to see next plot: 
                                    Hit <Return> to see next plot: 
                                    > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, k=20, bs="ps")+Rain+s(min(Days_last_rain,5), k=20, bs="ps"), data=Total)
                                  Error in model.frame.default(formula = Avg_Max_NO2 ~ Rain + Avg_Streak +  : 
                                                                 variable lengths differ (found for 'min(Days_last_rain, 5)')
                                                               > m=min(Total$Days_last_rain,5)
                                                               > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, k=20, bs="ps")+factor(Rain)+factor(Daytype), data=Total)
                                                               > summary(mod1)
                                                               
                                                               Family: gaussian 
                                                               Link function: identity 
                                                               
                                                               Formula:
                                                                 Avg_Max_NO2 ~ s(Avg_Streak, k = 20, bs = "ps") + s(DayNr, k = 40, 
                                                                                                                    bs = "ps") + s(b, k = 20, bs = "ps") + s(T_max, k = 20, bs = "ps") + 
                                                                 factor(Rain) + factor(Daytype)
                                                               
                                                               Parametric coefficients:
                                                                 Estimate Std. Error t value Pr(>|t|)    
                                                               (Intercept)       88.4733     0.6202  142.65  < 2e-16 ***
                                                                 factor(Rain)1     -9.6742     1.2531   -7.72 1.77e-14 ***
                                                                 factor(Daytype)1 -11.8640     1.0331  -11.48  < 2e-16 ***
                                                                 ---
                                                                 Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                               
                                                               Approximate significance of smooth terms:
                                                                 edf Ref.df      F  p-value    
                                                               s(Avg_Streak)  9.097 10.765 82.891  < 2e-16 ***
                                                                 s(DayNr)      14.015 17.032 17.416  < 2e-16 ***
                                                                 s(b)          14.637 15.797  4.191 5.64e-08 ***
                                                                 s(T_max)       5.361  6.641 62.627  < 2e-16 ***
                                                                 ---
                                                                 Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                               
                                                               R-sq.(adj) =  0.579   Deviance explained = 58.7%
                                                               GCV = 483.18  Scale est. = 472.97    n = 2183
                                                               > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, k=20, bs="ps")+factor(Rain)+factor(Daytype)+factor(Season), data=Total)
                                                               > summary(mod1)
                                                               
                                                               Family: gaussian 
                                                               Link function: identity 
                                                               
                                                               Formula:
                                                                 Avg_Max_NO2 ~ s(Avg_Streak, k = 20, bs = "ps") + s(DayNr, k = 40, 
                                                                                                                    bs = "ps") + s(b, k = 20, bs = "ps") + s(T_max, k = 20, bs = "ps") + 
                                                                 factor(Rain) + factor(Daytype) + factor(Season)
                                                               
                                                               Parametric coefficients:
                                                                 Estimate Std. Error t value Pr(>|t|)    
                                                               (Intercept)        89.501      3.096  28.906  < 2e-16 ***
                                                                 factor(Rain)1      -9.688      1.254  -7.726  1.7e-14 ***
                                                                 factor(Daytype)1  -11.870      1.034 -11.483  < 2e-16 ***
                                                                 factor(Season)2    -4.139      4.479  -0.924    0.356    
                                                               factor(Season)3    -1.525      5.271  -0.289    0.772    
                                                               factor(Season)4     1.631      4.840   0.337    0.736    
                                                               ---
                                                                 Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                               
                                                               Approximate significance of smooth terms:
                                                                 edf Ref.df      F  p-value    
                                                               s(Avg_Streak)  9.066 10.732 82.959  < 2e-16 ***
                                                                 s(DayNr)      13.390 16.448 11.795  < 2e-16 ***
                                                                 s(b)          14.640 15.800  4.169 6.43e-08 ***
                                                                 s(T_max)       5.400  6.687 61.103  < 2e-16 ***
                                                                 ---
                                                                 Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                               
                                                               R-sq.(adj) =  0.578   Deviance explained = 58.7%
                                                               GCV = 484.24  Scale est. = 473.48    n = 2183
                                                               > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, k=20, bs="ps")+factor(Rain)+factor(Daytype)+factor(Month), data=Total)
                                                               > summary(mod1)
                                                               
                                                               Family: gaussian 
                                                               Link function: identity 
                                                               
                                                               Formula:
                                                                 Avg_Max_NO2 ~ s(Avg_Streak, k = 20, bs = "ps") + s(DayNr, k = 40, 
                                                                                                                    bs = "ps") + s(b, k = 20, bs = "ps") + s(T_max, k = 20, bs = "ps") + 
                                                                 factor(Rain) + factor(Daytype) + factor(Month)
                                                               
                                                               Parametric coefficients:
                                                                 Estimate Std. Error t value Pr(>|t|)    
                                                               (Intercept)       92.0358    10.8439   8.487  < 2e-16 ***
                                                                 factor(Rain)1     -9.6345     1.2573  -7.663 2.75e-14 ***
                                                                 factor(Daytype)1 -11.8440     1.0311 -11.486  < 2e-16 ***
                                                                 factor(Month)2     3.5242     5.5015   0.641    0.522    
                                                               factor(Month)3     1.0815     8.0745   0.134    0.893    
                                                               factor(Month)4    -0.5147     9.8941  -0.052    0.959    
                                                               factor(Month)5    -2.3226    11.4809  -0.202    0.840    
                                                               factor(Month)6    -1.5549    12.8535  -0.121    0.904    
                                                               factor(Month)7    -0.9430    14.0862  -0.067    0.947    
                                                               factor(Month)8    -0.3721    15.2193  -0.024    0.980    
                                                               factor(Month)9     6.1816    16.2792   0.380    0.704    
                                                               factor(Month)10   -3.5616    17.2867  -0.206    0.837    
                                                               factor(Month)11  -22.3192    18.1909  -1.227    0.220    
                                                               factor(Month)12  -21.7843    19.0797  -1.142    0.254    
                                                               ---
                                                                 Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                               
                                                               Approximate significance of smooth terms:
                                                                 edf Ref.df      F  p-value    
                                                               s(Avg_Streak)  8.816 10.465 84.264  < 2e-16 ***
                                                                 s(DayNr)      13.669 16.874  6.878 2.55e-16 ***
                                                                 s(b)          14.684 15.838  4.201 5.12e-08 ***
                                                                 s(T_max)       5.569  6.889 60.443  < 2e-16 ***
                                                                 ---
                                                                 Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                               
                                                               R-sq.(adj) =   0.58   Deviance explained = 59.1%
                                                               GCV = 483.64  Scale est. = 471.07    n = 2183
                                                               > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, k=20, bs="ps")+factor(Rain)+factor(Daytype)+factor(Holiday), data=Total)
                                                               > summary(mod1)
                                                               
                                                               Family: gaussian 
                                                               Link function: identity 
                                                               
                                                               Formula:
                                                                 Avg_Max_NO2 ~ s(Avg_Streak, k = 20, bs = "ps") + s(DayNr, k = 40, 
                                                                                                                    bs = "ps") + s(b, k = 20, bs = "ps") + s(T_max, k = 20, bs = "ps") + 
                                                                 factor(Rain) + factor(Daytype) + factor(Holiday)
                                                               
                                                               Parametric coefficients:
                                                                 Estimate Std. Error t value Pr(>|t|)    
                                                               (Intercept)       90.7618     0.8769 103.499  < 2e-16 ***
                                                                 factor(Rain)1     -9.4899     1.2520  -7.580 5.12e-14 ***
                                                                 factor(Daytype)1 -11.6432     1.0332 -11.269  < 2e-16 ***
                                                                 factor(Holiday)1  -7.3513     1.9993  -3.677 0.000242 ***
                                                                 ---
                                                                 Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                               
                                                               Approximate significance of smooth terms:
                                                                 edf Ref.df      F  p-value    
                                                               s(Avg_Streak)  9.284 10.963 81.372  < 2e-16 ***
                                                                 s(DayNr)      12.834 15.705 15.816  < 2e-16 ***
                                                                 s(b)          14.610 15.773  4.277 3.43e-08 ***
                                                                 s(T_max)       5.944  7.313 58.621  < 2e-16 ***
                                                                 ---
                                                                 Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                               
                                                               R-sq.(adj) =   0.58   Deviance explained = 58.9%
                                                               GCV = 481.58  Scale est. = 471.29    n = 2183
                                                               > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, k=20, bs="ps")+factor(Rain)+factor(Daytype)+factor(Holiday)+s(users_Street30,k=20,bs="ps"), data=Total)
                                                               > summary(mod1)
                                                               
                                                               Family: gaussian 
                                                               Link function: identity 
                                                               
                                                               Formula:
                                                                 Avg_Max_NO2 ~ s(Avg_Streak, k = 20, bs = "ps") + s(DayNr, k = 40, 
                                                                                                                    bs = "ps") + s(b, k = 20, bs = "ps") + s(T_max, k = 20, bs = "ps") + 
                                                                 factor(Rain) + factor(Daytype) + factor(Holiday) + s(users_Street30, 
                                                                                                                      k = 20, bs = "ps")
                                                               
                                                               Parametric coefficients:
                                                                 Estimate Std. Error t value Pr(>|t|)    
                                                               (Intercept)       90.7571     0.8771 103.472  < 2e-16 ***
                                                                 factor(Rain)1     -9.5089     1.2529  -7.589 4.77e-14 ***
                                                                 factor(Daytype)1 -11.6301     1.0337 -11.251  < 2e-16 ***
                                                                 factor(Holiday)1  -7.3347     1.9999  -3.667 0.000251 ***
                                                                 ---
                                                                 Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                               
                                                               Approximate significance of smooth terms:
                                                                 edf Ref.df      F  p-value    
                                                               s(Avg_Streak)      9.333 11.015 80.927  < 2e-16 ***
                                                                 s(DayNr)          12.830 15.701 15.811  < 2e-16 ***
                                                                 s(b)              14.606 15.770  4.274 3.47e-08 ***
                                                                 s(T_max)           5.909  7.272 58.831  < 2e-16 ***
                                                                 s(users_Street30)  1.000  1.000  0.249    0.618    
                                                               ---
                                                                 Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                               
                                                               R-sq.(adj) =   0.58   Deviance explained = 58.9%
                                                               GCV = 481.97  Scale est. = 471.44    n = 2183
                                                               > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, k=20, bs="ps")+factor(Rain)+factor(Daytype)+factor(Holiday)+s(Vehicles_Km_Total,k=20,bs="ps"), data=Total)
                                                               Warning message:
                                                                 In smooth.construct.ps.smooth.spec(object, dk$data, dk$knots) :
                                                                 there is *no* information about some basis coefficients
                                                               > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, k=20, bs="ps")+factor(Rain)+factor(Daytype)+factor(Holiday)+s(Vehicles_Km_Total,k=10,bs="ps"), data=Total)
                                                               Warning message:
                                                                 In smooth.construct.ps.smooth.spec(object, dk$data, dk$knots) :
                                                                 there is *no* information about some basis coefficients
                                                               > summary(Total$Vehicles_Km_Total)
                                                               Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
                                                               2.137e+06 6.413e+06 8.581e+06 1.350e+07 9.059e+06 6.230e+09 
                                                               > tvk <- Total$Vehicles_Km_Total/max(Total$Vehicles_Km_Total)
                                                               > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, k=20, bs="ps")+factor(Rain)+factor(Daytype)+factor(Holiday)+s(tvk,k=20,bs="ps"), data=Total)
                                                               Warning message:
                                                                 In smooth.construct.ps.smooth.spec(object, dk$data, dk$knots) :
                                                                 there is *no* information about some basis coefficients
                                                               > summary(mod1)
                                                               
                                                               Family: gaussian 
                                                               Link function: identity 
                                                               
                                                               Formula:
                                                                 Avg_Max_NO2 ~ s(Avg_Streak, k = 20, bs = "ps") + s(DayNr, k = 40, 
                                                                                                                    bs = "ps") + s(b, k = 20, bs = "ps") + s(T_max, k = 20, bs = "ps") + 
                                                                 factor(Rain) + factor(Daytype) + factor(Holiday) + s(tvk, 
                                                                                                                      k = 20, bs = "ps")
                                                               
                                                               Parametric coefficients:
                                                                 Estimate Std. Error t value Pr(>|t|)    
                                                               (Intercept)       90.7864     0.8764 103.593  < 2e-16 ***
                                                                 factor(Rain)1     -9.4705     1.2516  -7.567 5.64e-14 ***
                                                                 factor(Daytype)1 -11.6740     1.0329 -11.302  < 2e-16 ***
                                                                 factor(Holiday)1  -7.4136     1.9974  -3.712 0.000211 ***
                                                                 ---
                                                                 Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                               
                                                               Approximate significance of smooth terms:
                                                                 edf Ref.df      F  p-value    
                                                               s(Avg_Streak)  9.102 10.771 82.230  < 2e-16 ***
                                                                 s(DayNr)      12.804 15.670 15.778  < 2e-16 ***
                                                                 s(b)          14.616 15.778  4.228 4.67e-08 ***
                                                                 s(T_max)       5.924  7.289 58.685  < 2e-16 ***
                                                                 s(tvk)         1.000  1.000  3.008    0.083 .  
                                                               ---
                                                                 Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                               
                                                               R-sq.(adj) =   0.58   Deviance explained = 58.9%
                                                               GCV = 481.43  Scale est. = 470.97    n = 2183
                                                               > plot(mod1)
                                                               Hit <Return> to see next plot: 
                                                                 Hit <Return> to see next plot: 
                                                                 Hit <Return> to see next plot: 
                                                                 Hit <Return> to see next plot: 
                                                                 > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, k=20, bs="ps")+factor(Rain)+factor(Daytype)+factor(Holiday)+tvk, data=Total)
                                                               > summary(mod1)
                                                               
                                                               Family: gaussian 
                                                               Link function: identity 
                                                               
                                                               Formula:
                                                                 Avg_Max_NO2 ~ s(Avg_Streak, k = 20, bs = "ps") + s(DayNr, k = 40, 
                                                                                                                    bs = "ps") + s(b, k = 20, bs = "ps") + s(T_max, k = 20, bs = "ps") + 
                                                                 factor(Rain) + factor(Daytype) + factor(Holiday) + tvk
                                                               
                                                               Parametric coefficients:
                                                                 Estimate Std. Error t value Pr(>|t|)    
                                                               (Intercept)       90.7277     0.8765 103.510  < 2e-16 ***
                                                                 factor(Rain)1     -9.4705     1.2516  -7.567 5.64e-14 ***
                                                                 factor(Daytype)1 -11.6740     1.0329 -11.302  < 2e-16 ***
                                                                 factor(Holiday)1  -7.4136     1.9974  -3.712 0.000211 ***
                                                                 tvk               27.0543    15.5997   1.734 0.083012 .  
                                                               ---
                                                                 Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                               
                                                               Approximate significance of smooth terms:
                                                                 edf Ref.df      F  p-value    
                                                               s(Avg_Streak)  9.102 10.771 82.230  < 2e-16 ***
                                                                 s(DayNr)      12.804 15.670 15.778  < 2e-16 ***
                                                                 s(b)          14.616 15.778  4.228 4.67e-08 ***
                                                                 s(T_max)       5.924  7.289 58.685  < 2e-16 ***
                                                                 ---
                                                                 Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                               
                                                               R-sq.(adj) =   0.58   Deviance explained = 58.9%
                                                               GCV = 481.43  Scale est. = 470.97    n = 2183
                                                               > lno2 = Total$Max_NO2[-nrow(Total)]
                                                               > tTotal <- Total[-1]
                                                               > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, k=20, bs="ps")+factor(Rain)+factor(Daytype)+factor(Holiday)+tvk+s(lno2,k=20,bs="ps"), data=tTotal)
                                                               Error in eval(predvars, data, env) : object 'DayNr' not found
                                                               > tTotal <- Total[-1,]
                                                               > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, k=20, bs="ps")+factor(Rain)+factor(Daytype)+factor(Holiday)+tvk+s(lno2,k=20,bs="ps"), data=tTotal)
                                                               Error in model.frame.default(formula = Avg_Max_NO2 ~ factor(Rain) + factor(Daytype) +  : 
                                                                                              variable lengths differ (found for 'tvk')
                                                                                            > b = b[-nrow(Total)]
                                                                                            > tvk = tvk[-nrow(Total)]
                                                                                            > mod1 = gam(Avg_Max_NO2~s(Avg_Streak, k=20, bs="ps")+s(DayNr, k=40, bs="ps")+s(b, k=20, bs="ps")+s(T_max, k=20, bs="ps")+factor(Rain)+factor(Daytype)+factor(Holiday)+tvk+s(lno2,k=20,bs="ps"), data=tTotal)
                                                                                            > summary(mod1)
                                                                                            
                                                                                            Family: gaussian 
                                                                                            Link function: identity 
                                                                                            
                                                                                            Formula:
                                                                                              Avg_Max_NO2 ~ s(Avg_Streak, k = 20, bs = "ps") + s(DayNr, k = 40, 
                                                                                                                                                 bs = "ps") + s(b, k = 20, bs = "ps") + s(T_max, k = 20, bs = "ps") + 
                                                                                              factor(Rain) + factor(Daytype) + factor(Holiday) + tvk + 
                                                                                              s(lno2, k = 20, bs = "ps")
                                                                                            
                                                                                            Parametric coefficients:
                                                                                              Estimate Std. Error t value Pr(>|t|)    
                                                                                            (Intercept)       89.6240     0.7827 114.508  < 2e-16 ***
                                                                                              factor(Rain)1     -8.5542     1.1297  -7.572 5.42e-14 ***
                                                                                              factor(Daytype)1 -11.3833     0.9360 -12.162  < 2e-16 ***
                                                                                              factor(Holiday)1  -4.9973     1.7592  -2.841  0.00455 ** 
                                                                                              tvk               35.7908    14.1041   2.538  0.01123 *  
                                                                                              ---
                                                                                              Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                                                            
                                                                                            Approximate significance of smooth terms:
                                                                                              edf Ref.df       F p-value    
                                                                                            s(Avg_Streak)  7.650  9.187  78.639 < 2e-16 ***
                                                                                              s(DayNr)      11.637 14.292  10.413 < 2e-16 ***
                                                                                              s(b)          13.859 15.137   2.471 0.00121 ** 
                                                                                              s(T_max)       3.237  4.116  34.650 < 2e-16 ***
                                                                                              s(lno2)        3.254  4.094 119.816 < 2e-16 ***
                                                                                              ---
                                                                                              Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
                                                                                            
                                                                                            R-sq.(adj) =  0.656   Deviance explained = 66.3%
                                                                                            GCV =  394.5  Scale est. = 386.43    n = 2182
                                                                                            > plot(mod1)
                                                                                            Hit <Return> to see next plot: 
                                                                                              Hit <Return> to see next plot: 
                                                                                              Hit <Return> to see next plot: 
                                                                                              Hit <Return> to see next plot: 
                                                                                              > 
                                                                                              > 