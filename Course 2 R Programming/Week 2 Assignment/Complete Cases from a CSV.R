# This function opens a directory id and takes values of 1:332 and then search for
## complete cases, storing the complete cases in a dataframe called bat with two 
## columns ID and nobs

complete <- function(directory, id = 1:332){
  full_files <- list.files(directory, full.names = TRUE)
  bat <- data.frame()
    for (i in id){
      all_cases <- read.csv(full_files[i])
        complete_cases <- sum(complete.cases(all_cases))
        td <- data.frame(i, complete_cases) #id is id number and nobs compelte cases
        bat <- rbind(bat, td)
    }
  colnames(bat) <- c("id", "nobs")
        bat
         }
