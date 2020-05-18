# Extract some fields

extract_some <- function( x , list ) {
  
  # Fields to extract
  cn = c ()
  for ( f in list ) {
    cn = c ( cn , grep(f , colnames(x), value=TRUE) )
  }
  
  
  library(dplyr)
  nx = select(x , !!!cn)
  
  return (nx)  
}





## Get fields, look for the new name, and reassign to the dataset!

rename_fields <- function(x) {
  
  library(stringr)

  list = c()
  for ( f in colnames(x) ) {

    
    fn = c()
    from = c("body" , "gravity" , "acc" , "gyro" , "jerk" , "mag" ,
             "time" , "freq" , "\\.mean\\."  , "\\.std\\." , 
             "\\.\\.X", "\\.\\.Y", "\\.\\.Z")
    
    to = c("Body" , "Gravity" , "Acceleration" , "Gyroscope" , 
           "Jerk" , "Magnitude" , "time" , "frequency" , "- Mean value" , "- Std.Dev" , "X" , "Y" , "Z")
    
    i = 1
    while(i <= length(from)) {
    
      fr = from[i]

      if (fr == "time") {
        
        if (substr(f , 1, 1) == "t") {
          fn = c(fn , to[i])
        }
      }

      else if (fr == "freq") {
        
        if (substr(f , 1, 1) == "f") {
          fn = c(fn , to[i])
        }
      }
      
      else if (grepl(fr, f, ignore.case = TRUE)) {
        fn = c(fn , to[i])
      }
    
      i = i + 1
      
    }
    
    nc = paste(fn , collapse=" ")
    if (nc > "") {
    }
    
    else {
      nc = f
    }

    nc = paste0(toupper(substring(nc, 1, 1)), substring(nc, 2))
            
    list = c(list , nc)
  }
  
  
  colnames(x) = list
  
  return (x)
}

  
  