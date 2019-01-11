#load catboost
library(catboost)

# load mlbench which contains boston dataset
library(mlbench)

# attach the BostonHousing dataset
data(BostonHousing)

#caret library for spliting data
library(caret)

# Split out validation dataset
# create a list of 80% of the rows in the original dataset we can use for training
set.seed(7)
validation_index <- createDataPartition(BostonHousing$medv, p=0.80, list=FALSE)
# select 20% of the data for validation
validation <- BostonHousing[-validation_index,]
# use the remaining 80% of data to training and testing the models
dataset <- BostonHousing[validation_index,]

#load dplyr to use select function
library(dplyr)
y_train <- unlist(dataset[c('medv')])
X_train <- dataset %>% select(-medv)

y_valid <- unlist(validation[c('medv')])
X_valid <- validation %>% select(-medv)

#convert data to catboost specific
train_pool <- catboost.load_pool(data = X_train, label = y_train)
test_pool <- catboost.load_pool(data = X_valid, label = y_valid)


# model parametesrs
params <- list(iterations=500,
               learning_rate=0.01,
               depth=10,
               loss_function='RMSE',
               eval_metric='RMSE',
               random_seed = 55,
               od_type='Iter',
               metric_period = 50,
               od_wait=20,
               use_best_model=TRUE)

#build model
model <- catboost.train(learn_pool = train_pool,params =  params)

#predict 
y_pred=catboost.predict(model,test_pool)

#calculate error metrics
postResample(y_pred,validation$medv)
