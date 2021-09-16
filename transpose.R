formatFile <- function(filename) {
  x <- read.csv(filename, header = TRUE, stringsAsFactors = FALSE)
  x<-subset(x, select=-c(Notes)) 
  rownames(x) <- x$Variable
  x$Variable <- NULL
  y <- as.data.frame(t(as.matrix(x)))
  y<-as_tibble(y)
  
  #adds Dates Column
  y$Dates<-c("9/9","9/10","9/11","9/12","9/13","9/14")
  
  y <- y %>%
    select(Dates, everything())
  y$Dates <- as.Date(y$Dates , format = "%m/%d") 
  
  
  return(y)
}
