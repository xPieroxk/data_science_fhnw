# activate the tidyr package (install if needed)
library(tidyr)

# define a function for later use
reduce_to_one_decimal <- function(l_values) {
  indexes <- which(l_values %/% 10 > 0)
  for (i in indexes) {
    while (l_values[i] %/% 10 > 0) {
      l_values[i] <- l_values[i] / 10
    }
  }
  return(l_values)
}

# read the csv, main folder is "data_science"
data <- read.csv("datasets/cgh_cars.csv")
print(signif(2.5, digits = 1))
signif()
# replace NA (empty values) and zeros with the average of the other records
# let's start with the mpg column
mpg <- data$mpg
zeros_na_indexes <- which(is.na(mpg) | mpg == 0)
non_zeros_na_indexes <- which(!(mpg == 0 | is.na(mpg)))
mean_mpg <- mean(mpg[non_zeros_na_indexes])
data$mpg[zeros_na_indexes] <- mean_mpg

# now the price column, in this case we just drop the records. Since price is the target variable we don't want to
# calculate the mean
data <- drop_na(data, price)

# now we handle negative values of the cyl column, for this purpose we use the abs function
data$cyl <- abs(data$cyl)

# clean wt column, in a way that every record has just one integer
data$wt <- reduce_to_one_decimal(data$wt)

# print the preprocessed data
print(data)