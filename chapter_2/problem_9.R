# 9
Auto = read.table("Auto.data", header = TRUE, stringsAsFactors = TRUE, na.strings = "?")
Auto = na.omit(Auto)                  # Removes the rows that contain NA"
View(Auto)
attach(Auto)

# (a) Quantitative: mpg, cylinders, displacement, horsepower, weight, acceleration
#     Qualitative: year, origin, name


# (b)
apply(Auto, 2, range) # x = Auto -> dataframe or matrix, MARGIN = 2 -> application is performed on columns, FUN = range -> applied function

# (c)
apply(Auto[, 1:6], 2, mean)     # 1:6 chooses the quantitative columns
apply(Auto[, 1:6], 2, sd)

# (d)
newAuto = Auto[-(10:85), ]         # Removes the 10th through 85th observations
apply(newAuto, 2, range)
apply(newAuto[, 1:6], 2, mean)
apply(Auto[, 1:6], 2, sd)

# (e)
# Let's create a scatterplot matrix by using pairs()
pairs(Auto[ , 1:7])       # 1:7 means from mpg to year
plot(weight, mpg)         # As we expected, fuel economy decreases as cars get more heavy. It looks like an inverse relationship
plot(horsepower, weight)  # Heavy cars need more power to do well (horsepower is a unit measurement of power).
plot(horsepower, mpg)     # My explanation to this plot is that this an indirect relationship:
                          # power correlates to weight which correlates to fuel economy.

plot(weight, acceleration)    # We can see a weak negative correlation. The correlation is not a strong one as the greater
                              # horsepower, which heavier cars have, balances the effect of weight on acceleration. (continues)

plot(horsepower, acceleration) # This can also explain why acceleration and power have a negative correlation.
                               # Of course, ceteris paribus, an increase in horsepower implies in an increase in acceleration,
                               # but here heavy cars tend to have a greater horsepower.

year_factor = as.factor(year) # Changing years from numeric to factor allows us to make boxplots when using plot
                              # I didn't change the column year from Auto because this would produce an error when we plotted
                              # pairs(Auto[ , 1:7])
plot(year_factor, mpg, xlab = "Year", ylab = "Fuel Economy (mpg)", col = "springgreen", varwidth = TRUE )
# We can also speculate that there is a trend of increasing car's fuel economy. But it is not safe to conclude this since 
# year's range is short.

# (f)
# displacement, weight, year.
# (It is not clear for me if there is a direct relationship between fuel economy and horsepower.)