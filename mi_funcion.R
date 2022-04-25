mi_funcion <- function() {
  library(ggplot2)
  g <- ggplot(data=mtcars, mapping=aes(cyl, mpg)) + geom_point()
  return(str(g))
}