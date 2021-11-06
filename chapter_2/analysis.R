function(single_data, whole_data) {          # single_data is the individual data that we want to compare to the whole_data
    state_single_data = c()                  # for each column of the single_data, we want to know the comparsison to the whole_data
    for(i in 1:length(single_data))          # length(single_data) = number of columns that it has
    {
        quartiles = quantile(whole_data[, i])    # quantile gives us the min, max and the quartiles, so in this case
                                                 # we want the quantile of the ith column of the whole_data
        # quartile[1] = min, quartile[2] = 1st quartile, quartile[3] = median, quartile[4] = 3rd quartile, quartile[5] = max
                                                 
        if (single_data[i] == quartiles[1]) {    # if single_data = min then paste "at min"
          state_single_data = append(state_single_data, "at min")  
        } else if (single_data[i] > quartiles[1] & single_data[i] < 0.999*quartiles[2]) {       # greater than min and less than the first quartile
          state_single_data = append(state_single_data, "below 1st quartile")
        } else if (single_data[i] > 0.999*quartiles[2] & single_data[i] < 1.001*quartiles[2]) { # at 1st quartile but it can hold some error
          state_single_data = append(state_single_data, "at 1st quartile")
        } else if (single_data[i] > 1.001*quartiles[2] & single_data[i] < 0.999*quartiles[4]) { # between 1st and 3rd quartile
          state_single_data = append(state_single_data, "between 1st and 3rd quartile")
        } else if (single_data[i] > 0.999*quartiles[4] & single_data[i] < 1.001*quartiles[4]) { # at 3rd quartile with some error
          state_single_data = append(state_single_data, "at 3rd quartile")
        } else if (single_data[i] > 1.001*quartiles[4] & single_data[i] < quartiles[5]) {       # above the 3rd quartile but not at the max
          state_single_data = append(state_single_data, "above 3rd quartile")
        } else {                                                                                # at max
          state_single_data = append(state_single_data, "at max")
        }
    }  
    return(state_single_data)     # it will return a vector that contains the comparison of each column of single_data and whole_data
}