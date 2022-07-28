
# Step 1

set.seed(300)

x_group_A <- matrix(rnorm(200*2,mean=0), nrow = 200, ncol = 2)

x_group_B <- matrix(rnorm(200*2,mean=3), nrow = 200, ncol = 2)

x_both_groups <- rbind(x_group_A,x_group_B)

y <- c(rep(1,200),rep(-1,200))

## Plot the data

my_data <- data.frame(x = x_both_groups, y = as.factor(y))

plot(x_both_groups, col = ifelse(y > 0,1,2), ylim = c(-2, 5), xlim = c(-2, 5))

legend("topleft",c("Group A (y = 1)","Group B (y = -1)"),col=c(1, 2), pch=1, text.col=c(1,2))


set.seed(300)

# train on 70% of data

train_sample <-  sample(1:400, 400*0.7)

data_train <-  my_data[train_sample,]

# test on 30% of remaining data

x_test <- x_both_groups[-train_sample,]

y_test <- y[-train_sample]

data_test <- my_data[-train_sample,]


library(e1071)

svm_model_c1 <- svm(y ~., data = data_train, kernel = "linear", cost = 1, scale = FALSE)

summary(svm_model_c1)


plot(svm_model_c1, data_train)

x_test <- x_both_groups[-train_sample,]

y_test <- y[-train_sample]

data_test <- my_data[-train_sample,]

y_predict <- predict(svm_model_c1, newdata = x_test)

table( y_test, y_predict)

mean(y_predict != y_test)


set.seed(1)

tune_out <- tune(svm, y ~., data = data_train, kernel = "linear", ranges = list ( cost = c(0.001, 0.01, 0.1, 1, 5, 10, 100, 1000, 10000, 1e5)) )

summary(tune_out)


### cost = 1e5

svm_model_c1e5 <- svm(y~., data = data_train, kernel = "linear", cost = 1e5, scale = FALSE)

summary(svm_model_c1e5)

plot(svm_model_c1e5, data_train)


y_predict_c1e5 <- predict(svm_model_c1e5, newdata = data_test)

summary(y_predict_c1e5)

mean(y_predict_c1e5 != y_test)

