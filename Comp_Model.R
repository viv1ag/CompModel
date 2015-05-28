final_data <- read.csv("data1.csv")

n.train <- nrow(final_data)

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

x = as.matrix(final_data)
trind = c(1:n.train)
teind = c((n.train+1):nrow(x))

#model_xg <- xgboost(param=param,data = final_data[1:n.train,],label=final_data[1:n.train,'Dependent'],nrounds=250)
model_xg <- xgboost(param=param,data = x[trind,],label=as.numeric(x[trind,1]),nrounds=250)
