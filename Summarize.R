sum_dataset <- function(x) {
  
  gb = group_by(x, activity, subject)
  
  toremove = c("activity" , "subject")

  fields = colnames(x)
  fields = fields[! fields %in% toremove]
  
  xsum = summarise_at(gb, fields , mean)

  return (xsum)  
}