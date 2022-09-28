library(parallel)
nCores <- detectCores()
nCores

# Sequential computing
x <- iris[which(iris[,5] != "setosa"), c(1,5)]
trials <- seq(1, 10000)
boot_fx <- function(trial) {
  ind <- sample(100, 100, replace=TRUE)
  result1 <- glm(x[ind,2]~x[ind,1], family=binomial(logit))
  r <- coefficients(result1)
  res <- rbind(data.frame(), r)
}
system.time({
  results <- lapply(trials, boot_fx)
})

#results

# Parallel computing using parLapply
library(snow)
cl <- makeCluster(nCores, type = 'SOCK')
system.time(results <- parLapply(cl, trials, boot_fx))
stopCluster(cl)

# Parallel computing using parLapply
x <- iris[which(iris[,5] != "setosa"), c(1,5)]
trials <- seq(1, 10000)
cl <- makeCluster(nCores, type = 'SOCK')
clusterExport(cl, "x")
system.time(results <- parLapply(cl, trials, boot_fx))
stopCluster(cl)

# Almost any OS
library(doParallel)
library(iterators)
library(foreach)
cl <- makeCluster(nCores, type = 'SOCK')
# doParallel::
registerDoParallel(cl)
result <- foreach(i = 1:10000) %dopar% sqrt(i)

