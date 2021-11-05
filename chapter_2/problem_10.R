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
min_dev = t(Boston[medv == min(medv), ])

