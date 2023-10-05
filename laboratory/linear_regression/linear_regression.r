# activate the library (intall if needed)
library(ISLR)

dataset <- Auto

# hard encode names
names <- Auto$name
column_mapping <- match(names, names)
dataset$name <- column_mapping

# apply linear regression
model <- lm(mpg ~ ., data = dataset)

summary(model)

# 3.324 error without dropping any column
