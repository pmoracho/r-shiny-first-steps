library(testthat)

# 1. Definimos una función que devuelve una gráfico
mi_funcion_grafica <- function() {
  library(ggplot2)
  ggplot(mtcars, aes(disp)) + geom_histogram(bins = 30)
}

# 2. Ejecutamos el test no interactivamente y se genera un snapshot
test_that("histograms not draw correctly", {
  vdiffr::expect_doppelganger("ggplot2 histogram", mi_funcion_grafica())
})


# 3. Modificar mi_funcion_grafica() par que retorne otro gráfico y correr el test
# 4. snapshot_review() para revisar


library(testthat)

# Correr como test, no interactivamente
# Primera ejecución de la función genera el golden test ver carpeta _snaps
mi_funcion <- function() {
  library(ggplot2)
  g <- ggplot(data=mtcars, mapping=aes(mpg, cyl)) + geom_point()
  toString(g)
}

# Descomentar para hacer fallar el test
# Ver carpeta _snaps

# mi_funcion <- function() {
#   library(ggplot2)
#   g <- ggplot(data=mtcars, mapping=aes(disp, cyl)) + geom_point()
#   toString(g)
# }
# 

test_that("mi_funcion", {
  local_edition(3)
  out <- mi_funcion()
  expect_snapshot_output(out)
})

# Para revisar la diferencia
# Instalar shiny y diffviewer
# snapshot_review("mi_funcion")

# Para aceptar el caso nuevo (reemplaza el anterior)
# snapshot_accept('mi_funcion')
