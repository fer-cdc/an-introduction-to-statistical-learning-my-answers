# 10 (a)
library(ISLR2)
View(Boston)
?Boston
attach(Boston)
# 506 and 13 columns
# The 13 variables values of each of the 506 suburbs are displayed in a single row.
# Each column represents one of the 13 housing variables.

# (b)
# We didn't use pairs() as the scatterplots that it produces are very small and thus it makes difficult to see the relationships.
# Instead, I plotted each pair of variables separately.
for(i in 1:13) { 
    j = 1
    while(i > j) {
      plot(Boston[ , i], Boston[, j], xlab = colnames(Boston)[i], ylab = colnames(Boston)[j])
      j = j + 1
    }
}
# By looking at the graphs, we conclude that:

# crim correlates to: age, dis, rad, tax
# indus correlates to: age, dis, zn, nox, tax
# lstat correlates to: rm, nox, medv, dis, age
# nox correlates to: rad, zn, age
# rm correlates to: medv, dis
# age correlates to: zn, dis


# (c)
plot(age, crim)
# In general, the older the dwelling the higher the crime. Non-linear relationship.
plot(dis, crim)
# In general, the closer to a worker are, the higher the crime. Non-linear relationship.
plot(rad, crim)
# In general, the higher the accessibility to radial highways, the higher the crime. Non-linear relationship.
plot(tax, crim)
# It might be the case that the crimes occur in affluent areas.

# (d) Here we find data that have value above Q3 + 1.5 IQR for each value considered.
boxplot(crim)
quantile(crim)
# So we consider as high crime rate what is above Q3 + 1.5 IQR = 3.677083 + 1.5*(3.677083 - 0.082045)
3.677083 + 1.5*(3.677083 - 0.082045)    # = 9.07
high_crime_rate = Boston[crim > 9.07, ]
dim(high_crime_rate)[1]       # Returns the number of rows = 66 ([2] would have returned the number of columns)

# Tax rates
boxplot(tax)      # no outliers

boxplot(ptratio)   # only outliers with a very low ptratio value


# (e) 
dim(Boston[chas == 1, ])[1]     # 35 suburbs

# (f)
median(ptratio)     # 19.05

# (g)
min_mdev = Boston[medv == min(medv), ]    # The census tract are number 399 and 406
View(min_dev)

#"What are the values of the other predictors for that census tract, and how do those values compare to the 
# overall ranges for those predictors?""
# To answer this question, I created a function in a file called "analysis.R" in which it compares each variable 
# of a determined census tract to the Boston data. The output just answers if the variable's value are below or above certain 
# quartile.

comparison = dget("analysis.R")
comparison_399 = comparison(min_mdev[1, ], Boston)     # min_dev[1, ] is the data of the census tract 399
# Now we are going to combine it with the 399 data by using rbind function. We also transpose the data in order to make it
# more clear to visualize.

analysis_399 = t(rbind(min_mdev[1, ], comparison_399))
#399       2                   
#crim    "38.3518" "above 3rd quartile"
#zn      "0"       "at min"            
#indus   "18.1"    "at 3rd quartile"   
#chas    "0"       "at min"            
#nox     "0.693"   "above 3rd quartile"
#rm      "5.453"   "below 1st quartile"
#age     "100"     "at max"            
#dis     "1.4896"  "below 1st quartile"
#rad     "24"      "at 3rd quartile"   
#tax     "666"     "at 3rd quartile"   
#ptratio "20.2"    "at 3rd quartile"   
#lstat   "30.59"   "above 3rd quartile"
#medv    "5"       "at min"

# By doing the same to the 406th census, we have:
comparison_406 = comparison(min_mdev[2, ], Boston)
analysis_406 = t(rbind(min_mdev[2, ], comparison_406))
#406       2                   
#crim    "67.9208" "above 3rd quartile"
#zn      "0"       "at min"            
#indus   "18.1"    "at 3rd quartile"   
#chas    "0"       "at min"            
#nox     "0.693"   "above 3rd quartile"
#rm      "5.683"   "below 1st quartile"
#age     "100"     "at max"            
#dis     "1.4254"  "below 1st quartile"
#rad     "24"      "at 3rd quartile"   
#tax     "666"     "at 3rd quartile"   
#ptratio "20.2"    "at 3rd quartile"   
#lstat   "22.98"   "above 3rd quartile"
#medv    "5"       "at min" 

# (h)

