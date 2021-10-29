# 8 (a) We import the data and set stringAsFactors = TRUE. The advantage of doing this is that statistical methods work better. Compare summary(college) in both cases.
college = read.csv("College.csv", stringsAsFactors = TRUE)

# 8 (b)
# The default way of calling a dataframe's column is dull so we simplify that task by using attach():
attach(college)
# rownames(college) gives college's rows a name for them. We choose the college name to be their names
rownames(college) = college[, 1]
# We delete colleges name as we don't want to threat them as data.
college = college[, -1]
View(college)

# 8 (c) i.
summary(college)     # We can see here that some data are wrong: PhD Max = 103%, Grad.Rate = 118%. We are going to find
#which universities they are.

# ii.
pairs(college[1:10]) # Doesn't help too much

# iii.
plot(Private, Outstate)

# iv
Elite = rep("No", nrow(college))      # Creates a "column vector" with char = "No" for each vector element.
Elite[Top10perc > 50] = "Yes"         # Now the rows associated to Top10perc > 50 change from a "No" class to a "Yes" class.
                                      # These universities belong to a group that we call as Elite.

Elite = as.factor(Elite)

#> par(mfrow=c(2,2))
#> hist(Apps, breaks = seq(min(Apps),max(Apps), length.out = 21))
#> ratio_accept = Accept/Apps
#> plot(ratio_accept, Top10perc)
#> plot(ratio_accept, Top10perc)
#> plot(Top10perc, Grad.Rate)
#> college[Grad.Rate>100]