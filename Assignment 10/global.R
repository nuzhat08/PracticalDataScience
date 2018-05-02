library(xgboost)
library(tidyverse)

DiamondClass <-xgb.load("iris.model")
load("SpeciesClassInfo.rda")


generatePreds<- function (Sepal_length = 5,Sepal_width = 3, Petal_length = 1, Petal_width = 1){
  
  testDF<- as.matrix(Sepal_length,Sepal_width, Petal_length, Petal_width)
  
  
  
  preds<- predict(SpeciesClass, as.matrix(testDF))
  
  data.frame(
    Species = SpeciesClassInfo$var.levels
    , preds
  )%>%
    arrange(desc(preds))
}
