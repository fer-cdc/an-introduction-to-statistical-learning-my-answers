# 10 (a)
library(ISLR2)
View(Boston)
?Boston
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

# crim correlates to: nox, age, dist, rad, tax, ptratio
# indus correlates to: age, dis, zn, nox, tax
# lstat correlates to: rm, nox, medv, dis, age
# nox correlates to: rad, zn, age
# rm correlates to: medv, dis
# age correlates to: zn, dis


