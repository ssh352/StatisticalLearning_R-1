# Linear Discriminant Analysis
require(ISLR) # dataset package
require(MASS) # math package

lda.fit=lda(Direction~Lag1+Lag2, data=Smarket, subset = Year<2005)
lda.fit
plot(lda.fit)
# plots the values of the linear discriminant function separately for the up
# group and the down group

# subset of the data frame > test data
Smarket.2005=subset(Smarket,Year==2005)
lda.pred=predict(lda.fit,Smarket.2005)
lda.pred[1:5,]
class(lda.pred)
data.frame(lda.pred)[1:5,]

# Little confusion matrix
table(lda.pred$class,Smarket.2005$Direction)
mean(lda.pred$class==Smarket.2005$Direction)
