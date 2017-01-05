## A script to import pollutant data for ids from 1:332
## and then create a data frame 'dat' is then passed to the 
## mean function to caluclate pollutant means 

pollutantmean <- function(directory, pollutant, id = 1:332) {
        files_full <- list.files(directory, full.names = TRUE) 
        
        dat <- data.frame()
        
        for (i in id) {
                dat <- rbind(dat, read.csv(files_full[i]))
        }
        
        mean(dat[, pollutant], na.rm = TRUE)
}