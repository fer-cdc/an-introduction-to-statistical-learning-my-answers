function(single_data, whole_data) {
    state_single_data = c()
    quartiles = quantile(whole_data)
    if (single_data == quartiles[1]) {
        state_single_data = append(state_single_data, "at min")  
    } else if (single_data > quartiles[1] & single_data < 0.999*quartiles[2]) {
        state_single_data = append(state_single_data, "below 1st quartile")
    } else if (single_data > 0.999*quartiles[2] & single_data < 1.001*quartiles[2]) {
        state_single_data = append(state_single_data, "at 1st quartile")
    } else if (single_data > 1.001*quartiles[2] & single_data < 0.999*quartiles[4]) {
        state_single_data = append(state_single_data, "between 1st and 3rd quartile")
    } else if (single_data > 0.999*quartiles[4] & single_data < 1.001*quartiles[4]) {
        state_single_data = append(state_single_data, "at 3rd quartile")
    } else if (single_data > 1.001*quartiles[4] & single_data < quartiles[5]) {
        state_single_data = append(state_single_data, "above 3rd quartile")
    } else {
        state_single_data = append(state_single_data, "at max")
    }

    return(state_single_data)
}