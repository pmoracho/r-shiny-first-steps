

mi_funcion <- function() {
    library(ggplot2)
    g <- ggplot(data=mtcars, mapping=aes(hp, mpg)) + geom_point()
    toString(g)
}

test_that("mi función", {
  local_edition(3)
  out <- mi_funcion()
  expect_snapshot_output(out)
  
  expect_condition()
})

library(vdiffr)
test_that("ggplot2 histogram", {
  p <- ggplot(mtcars) + geom_histogram(aes(hp))
  expect_doppelganger("default histogram", p)
})

otra_funcion <- function() {
  warning("Atención")
  message("Mensaje")
}

expect_warning(otra_funcion(), "Atención")
expect_message(otra_funcion(), "Mensaje")
expect_message(expect_warning(otra_funcion(), "Atención"), "Mensaje")

otra_funcion_con_error <- function() {
  stop('Error!')
}


expect_error(otra_funcion_con_error, 'Error!')
