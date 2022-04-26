library(assertthat)

x <- "x"
x <- 1:10

prueba <- function(x) {
  if (is.numeric(x))  stop("X no es numérico")
  return (1)
}

prueba("a")

x <- "a"
stopifnot(is.numeric(x))

assert_that(is.numeric(x))

stopifnot(length(x) == 5)
assert_that(length(x) == 5)

is_odd <- function(x) {
  assert_that(is.numeric(x),
              length(x) == 1,
              x < 5)
  x %% 2 == 1
}

is_odd(6)
is_odd("6")
is_odd(1:2)


options(isAssertionDisabled = TRUE)
options(isAssertionDisabled = FALSE)

x <- "cadena"
assert_that(is.numeric(x))
assert_that(is.numeric(1))

assert_that <- function (..., env = parent.frame()) {
  if (isTRUE(getOption("isAssertionDisabled"))) return(TRUE)
  res <- see_if(..., env = env)
  if (res)
    return(TRUE)
  stop(assertthat:::assertError(attr(res, "msg")))
}

# 
library("testthat")

local_edition(3)

expect_equal(mtcars[-1], mtcars)

f1 <- factor(letters[1:3])
f2 <- factor(letters[1:3], levels = letters[1:4])

f1
f2

expect_equal(f1, f2)

expect_identical(1/3 + .1 - .1, 1/3)
expect_identical(1/3 + .1 -. 1, 1/3, tolerance = testthat_tolerance())


x <- stop("Mensaje")

try


prueba <- function() {
  stop("Detenemos la funcion")
  return(0)
}

x <- tryCatch(prueba(), 
         error = function(e) paste('El error es:', e)
         )

try {
  
}
catch {
  
}

tryCatch(prueba(), silent=TRUE)

g <- ggplot(data=mtcars, mapping=aes(disp, cyl)) + geom_point()

g + geom_smooth()

dput(g)

class(x)

warning("Cuidado")
message("mensaje")

mi_funcion <- function() {
  library(ggplot2)
  g <- ggplot(data=mtcars, mapping=aes(disp, cyl)) + geom_point()
  toString(g)
}

test_that("mi función no funciona!", {
  local_edition(3)
  out <- mi_funcion()
  expect_snapshot_output(out)
})

# snapshot_accept('mi_funcion')
# snapshot_review("mi_funcion") # Instalar shiny y diffviewer


library(vdiffr)
test_that("ggplot2 histogram", {
  p <- ggplot(mtcars) + geom_histogram(aes(hp))
  expect_doppelganger("default histogram", p)
})

install.packages('config')

library(config)

Sys.setenv(R_CONFIG_ACTIVE = "prod") 

cfg <- config::get(file= "config.yaml")
cfg



library(testthat)

mi_funcion <- function() {
  library(ggplot2)
  g <- ggplot(data=mtcars, mapping=aes(mpg, cyl)) + geom_point()
  dput(g)
}

mi_funcion()

test_that("mi función No funciona!", {
  local_edition(3)
  out <- mi_funcion()
  expect_snapshot_output(out)
})

# snapshot_accept('mi_funcion')
# snapshot_review("mi_funcion") # Instalar shiny y diffviewer
