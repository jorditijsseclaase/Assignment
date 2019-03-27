# library(readr)

done = FALSE
while (!done){
  cat("Are you sure you want to reset the HOURLY dataset? (Yes/No) ")
  asw <- readLines("stdin",n=1)  
  
  if (asw=='Yes'){
    df <- readr::read_csv("RT_traffic_hourly.csv")
    readr::write_csv(head(df,0), "RT_traffic_hourly.csv")
    done =TRUE
  }
  
  if (asw=='No'){ done =TRUE }
}