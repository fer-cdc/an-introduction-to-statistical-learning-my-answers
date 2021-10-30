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

# v
par(mfrow=c(2,2))

ratio_accept = Accept/Apps
# Defining ratio_accept: it measures, relatively, how difficult is to be accepted at a certain college.

hist(ratio_accept, breaks = seq(min(ratio_accept), max(ratio_accept), length.out = 21))  # This is the way to produce 21 bins
# Students are doing fine when it comes to be accepted.

hist(Grad.Rate, breaks = seq(min(Grad.Rate), max(Grad.Rate), length.out = 21)) 
# But not so fine when it comes to get graduated.

hist(Top10perc, breaks = seq(min(Top10perc), max(Top10perc), length.out = 21))

hist(Top25perc, breaks = seq(min(Top25perc), max(Top25perc), length.out = 21))
# There is a hope for students that are not in the top 25% of high school class. 


# vi
plot(ratio_accept, Top10perc, ylim=c(0,100))
# There is an inverse relationship between them. It seems that a parabola would fit very well. 
# The more the top students aplly, the more difficult is to be accepted.

plot(Top10perc, Grad.Rate)
# It seems also that the graduation rate and the ratio of top 10 students in a college have a log relationship. 
# From the 60th percentile on, the relationship doesn't change.

# Now let us find out which are the wrong data that we talked about in (c) i.
wrong_grad.rate = college[Grad.Rate > 100,]
# Cazenovia College.
wrong_phd.ration = college[PhD > 100,]
# Texas A&M University at Galveston.