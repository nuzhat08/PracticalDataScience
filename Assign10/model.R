library(xgboost)
library(mlogit)
library(tidyverse)
library(data.table)
library(DT)

Iris<-iris


y1<- Iris$Species
var.levels <- levels(y1)
y = as.numeric(y1) -1 


noOutcome<-Iris[,-5]

x = noOutcome[,c( 'Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width')]
var.names <- names(noOutcome)


x = as.matrix(x)


params <-list(
  "objective" = "multi:softprob"
  ,"eval_metric" = "mlogloss"
  , "num_class" = length(table(y))
  , "eta" = .5
  , "max_depth" = 3
  , "nthread" = 8
)

cv.nround = 250

bst.cv <- xgb.cv(param = params, data = x, label = y, nfold = 5, nrounds = cv.nround
                 ,missing = NA, prediction = TRUE)

nrounds= which.min(bst.cv$evaluation_log$test_mlogloss_mean)
bst.cv$evaluation_log[nrounds,]

SpeciesClass<- xgboost(param = params, data = x, label = y,  nrounds = cv.nround
                       ,missing = NA)

xgb.importance(var.names, model = SpeciesClass)
xgb.save(SpeciesClass, "iris.model")

SpeciesClassInfo<-list(
  var.names = var.names,
  var.levels = var.levels
)
save(SpeciesClassInfo, file= "SpeciesClassInfo.rda")



generatePreds<- function(Sepal_length = 5,Sepal_width = 3, Petal_length = 1, Petal_width = 1){
  
  testDF<- as.matrix(Sepal_length,Sepal_width, Petal_length, Petal_width)
}


preds<- predict(SpeciesClass, as.matrix(Iris$Sepal.Length, Iris$Sepal.Width))


data.frame(
  Species = var.levels
  , preds
)%>%
  arrange(desc(preds))




