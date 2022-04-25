library(tidyverse)


a <- 1
a[1]

hola <- function(cadena) {

  if (substr(cadena, nchar(cadena), nchar(cadena)) == 'a') {
    paste("Hola Señora", cadena)
  }  else {
    paste("Hola Señor", cadena)
  }
    
}

a <- "Maria"
a <- c("Maria", "Juan")
hola3(a)


hola2 <- function(cadena) {
  
  if (length(cadena > 1)) stop("La longitud de cadena debe ser 1")
  
  if (substr(cadena, nchar(cadena), nchar(cadena)) == 'a') {
    paste("Hola Señora", cadena)
  }  else {
    paste("Hola Señor", cadena)
  }
  
}

hola3 <- function(cadena) {

  ifelse(substr(cadena, nchar(cadena), nchar(cadena)) == 'a',
         paste("Hola Señora", cadena),
         paste("Hola Señor", cadena))
}


TRUE != FALSE

a <- integer()
  
length(a)
 
a <- 1:100

m <- matrix(a, ncol=10)

dim(m)
dim(m) <- NULL

l <- list(a=1:5, b="hola")
l$a

# Factores
library(tidyverse)



opciones <- c('Candidato 1', 'Candidato 2', 'Candidato 3', 'En blanco', 'No sabe/No contesta')
as.numeric(factor(opciones))


set.seed(2020)
df <- data.frame(voto = sample(opciones, 100, replace = TRUE))
str(df)
dput(df)
class(df)
glimpse(df)

plot(table(df$voto))

xtabs(table(df$voto))

df %>%
  filter(voto != 'Candidato 3') %>% 
  group_by(voto) %>% 
  summarise(cant = n()) %>% 
  ggplot(mapping=aes(x = cant, y = voto, fill = voto)) +
    geom_col()
    


df %>%
  mutate(voto = factor(voto)) %>% 
  filter(voto != 'Candidato 3') %>% 
  group_by(voto) %>% 
  summarise(cant = n()) %>% 
  plot()
  
  ggplot(mapping=aes(x = cant, y = factor(voto))) +
  geom_col()

cilindros <- factor(c(4, 6, 8), ordered = TRUE)

mtcars %>% 
  ggplot(aes(x=disp, y=mpg)) + 
  geom_point() +
  geom_smooth(span = .4)


1:6 * 1:2

df <- data.frame(voto = sample(f, 100, replace = TRUE))
class(df$voto)
levels(df$voto)




sum(c(1:2, NA), na.rm = TRUE)

fecha <- as.Date('2020-04-25')
class(fecha)
as.numeric(fecha)

df %>%
  mutate(voto = factor(voto),
         voto_numerico = as.numeric(voto))

!!

library("tidyverse")
library(tidyverse)

library(tidyverse)


tidyverse

prueba <- function(x, y, ...) {
  print(x, ...)
  print(y)
}

prueba("hola", "hola", 1, 3)


mtcars[mtcars$cyl == 4, ]

subset(mtcars, cyl == 4)

