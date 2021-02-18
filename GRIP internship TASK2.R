iris
head(iris)

##installing the required packages for machine learning 

install.packages("caret", dependencies=TRUE, repos='http://cran.rstudio.com/') 
install.packages("cluster",dependencies=TRUE,repos='http://cran.rstudio.com/') 
install.packages("factoextra",dependencies=TRUE,repos='http://cran.rstudio.co m/') 
install.packages("mlbench",dependencies=TRUE,repos='http://cran.rstudio.com/ ') 
install.packages("rpart", dependencies=TRUE, repos='http://cran.rstudio.com/') 

library(caret) 
library(cluster) 
library(rpart) 
library(mlbench) 

iris1 <- iris[1:4]

kmax <- 15
wss <- sapply(1:kmax,
              function(k){kmeans(iris1, k, nstart = 50, iter.max = 15)$tot.withinss}
             )
wss

plot(1:kmax, wss,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")




model <- kmeans(iris1,centers = 3)
summary(model)
clusplot(iris,model$cluster,color = T, shade = T, labels = 2)  


