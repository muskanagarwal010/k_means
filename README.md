#Task: Prediction using Unsupervised Machine Learning
#Question: From the given ‘Iris’ dataset, predict the optimum number of clusters
#and represent it visually.

##viewing the data

iris
head(iris)

##calling the required packages for machine learning 

library(caret) 
library(cluster) 
library(rpart) 
library(mlbench) 

##creating the required dataset
iris1 <- iris[1:4]


##applying a function to determine the number of clusters using the elbow method
kmax <- 15
wss <- sapply(1:kmax,
              function(k){kmeans(iris1, k, nstart = 50, iter.max = 15)$tot.withinss}
             )
wss

##plotting the graph for wss

plot(1:kmax, wss,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")

##We see a drift at 2 and then a little more drop at k=3
##For increasing clusters after 3, we don't observe much decrease is the total 
##within clusters sum of squares.So we go on with 3 clusters.


##creating our model using k-means clsutering with 3 clusters
model <- kmeans(iris1,centers = 3)
summary(model)

##plotting the 3 cluster model
clusplot(iris,model$cluster,color = T, shade = T, labels = 2)  
