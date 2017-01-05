sort_by_column <- function (cities, col1, col2){
orderdata <- cities[order(cities[,col1],cities[,col2]),]
return(orderdata)
}
sort_by_column_NA <- function (x1){
  for (i in 3:5) {
    x1[,i] <- suppressWarnings(as.numeric(levels(x1[,i])[x1[,i]]))
  }
  
sort_by_column_NA <- function (citiesna, column){
for (i in 3:4) {
citiesna[,i] <- suppressWarnings(as.numeric(levels(citiesna[,i])[citiesna[,i]]))
}
orderdata <- citiesna[order(citiesna[,column]),]
orderdata <- orderdata[complete.cases(orderdata),]
return(orderdata)
}

sort_country <- function(cities, country, column){
selectcountry <- cities[grep(country, cities$countries),]
orderdata <- selectcountry[order(selectcountry[,column]),]
  return (orderdata)
}

find_cityrank <- function(cities, rank, column){
cityrank <- cities[order(decreasing = TRUE, cities[,column]),]
return(as.character(cityrank[rank,1]))
}

rank_by_country <- function(cities,column, rank){
countries <- levels(cities[,2])
output <- vector()
for (i in 1:length(countries)){
countrydata <- cities[grep(countries[i], cities$countries),]
orderdata <- countrydata[order(decreasing = TRUE, countrydata[,column]),]
output <- append(output, as.character(orderdata[rank,1]))
for (l in 3:4) {
output <- append(output, as.character(orderdata[rank,l]))
}
}
 output <- as.data.frame(matrix(output,length(countries),3, byrow = TRUE))
    ## Name of the columns will be "cities", "areakm2" and "populationk". Name of the rows are the countries.
    colnames(output) <- c("cities","areakm2","populationk")
    rownames(output) <- countries
    return(output)
    }