final_data <- read.csv("data1.csv")

train <- final_data[c(1:800),]
test <- final_data[c(801:1000),]

n.train <- nrow(train)

#xgboost model
library(xgboost)
param <- list("objective" = "reg:linear",
              "num_class" = 9,
              "nthread" = 8,
              "eta" = 0.08,
              "subsample"=0.8,
              "gamma" = 1,
              "min_child_weight" = 2,
              "max_depth"= 12,
              "colsample_bytree" = 1
)

x <- sapply(final_data,as.numeric)
x = matrix(as.numeric(x),nrow(x),ncol(x))
y <- train[,'Dependent']
trind = 1:length(y)
teind = (nrow(train)+1):nrow(x)

# Train the model
model_xg <- xgboost(param=param,data = x[trind,], label = y,nrounds=250)
