## This function accesses a database with a requirement that the number of cases
## (in this case sulfate and nitrite airpollution) be greater than 0. 
## It then uses the cor function to establish a correlation between sulfate and nitrate
## placing the results in the vector dat 

corr <- function(directory, threshold = 0) {
        files_full <- list.files(directory, full.names = TRUE)
        dat <- vector(mode = "numeric", length = 0)
        
        for (i in 1:length(files_full)) {
                moni_i <- read.csv(files_full[i])
                csum <- sum((!is.na(moni_i$sulfate)) & (!is.na(moni_i$nitrate)))
                if (csum > threshold) {
                        tmp <- moni_i[which(!is.na(moni_i$sulfate)), ]
                        submoni_i <- tmp[which(!is.na(tmp$nitrate)), ]
                        dat <- c(dat, cor(submoni_i$sulfate, submoni_i$nitrate))
                }
        }
        
        dat
}