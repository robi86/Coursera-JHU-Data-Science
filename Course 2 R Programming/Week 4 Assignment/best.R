best <- function (state, outcome){
  data <- read.csv("outcome-of-care-measures.csv")
 
  states <- levels(data[,7][data[,7]])
  state_flag = FALSE
  for (i in 1:length(states) {
    if (state == states[i]) { state_flag = TRUE}
      if (!stage_flag) { stop("invalid state")}

     if (!(outcome == "heart attack") | (outcome == "heart failure") | 
         (outcome = "pneumonia")){ stop("invalid outcome") }}
    
   col <- if (outcome = "heart attack"){
     col <- data[,11]}
   else if (outcome = "heart failure"){
    col <- data[,17]}
    else {col <- data[,23]}
   
   sort_by_column_NA <- function (citiesna, column){
     for (i in 3:4) {
       citiesna[,i] <- suppressWarnings(as.numeric(levels(citiesna[,i])[citiesna[,i]]))
     }
     orderdata <- citiesna[order(citiesna[,column]),]
     orderdata <- orderdata[complete.cases(orderdata),]
     return(orderdata)
   }
   
}
   data [, col] <- supress.Warnings(as.numeric(levels(data[,col])[data[,col]]))
   data [,2] <- as.character(data[,2])
   statedata <- data[grep(state, data$state)]
     orderdata <- statedata[order(statedata[,col],statedata[,2] na.last = NA),]
     orderdata[1,2]
  }
  
} 