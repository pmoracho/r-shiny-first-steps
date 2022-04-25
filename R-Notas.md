# R

## Una visión histórica

* 1969/72: C - Dennis Ritchie, Unix - Ken Thompson, Dennis Ritchie, Brian
Kernighan, Douglas McIlroy, y Joe Ossanna
* 1976: Rick Becker, Allan Wilks, John Chambers Bell Laboratories. John Wilder
Tukey - boxplot - Exploratory Data Analysis - bit. Calling Fortran subroutines
* 1979: Port a Unix
* 1980: S se licencia y sale de los laboratorios de Bell
* 1984: Primeros libros y manuales
* 1988: Reescritura - Macros -> funciones - OOP S3 -Becker, R. A., Chambers, J.
M. and Wilks, A. R. (1988) The New S Language. Wadsworth & Brooks/Cole. (base para R)
* 1991-1993: R - Ross Ihaka and Robert Gentleman - University of Auckland
* 1998: Última actualización del lenguaje - S4
* 1997  R Core Team
* 2003 R Foundation was founded as a non-profit organization
* 2011 RStudio - Tidyverse - ggplot - Shiny - Rmarkdown

### La explosión estadística

* Mayor performance en hardware
* Internet / Datos masivos ¿Que hacemos con ellos?
  * Base teórica de la estadística imposible de implementar antes
* Desarrollo de la IA, google translate, cambio de enfoque

### R subroducto (versus otros lenguajes)

Información en la forma de:
  
  + dato crudo por pantalla
+ exportación de datos
+ Gráficos
+ Informes estáticos - Rmarkdown
+ Shiny

## Rstudio

* Rstudio Cloud
* Github - repositorio
* Contexto de CVS (Distribution Revision Control)
* Desarrollo multi usuario/single user (remoto!)
* Historia
* Proyectos autocontenidos
* Configuración
* Proyectos

## Algunos conceptos

* Sesión
* Entorno
* Workspace -> El `.RData` por defecto o cualquier otro (binario)
* `.Rprofile` (código de initialization se carga al iniciar R)
* Rstudio Projects -> `*.Rprj`

## ¿Por qué R es tan complicado?

* Un paradigma antiguo, compatibilidad hacia atrás
* DSL (Domain Specific Language)
* Subroducto del lenguaje
* No escalares
* Datos básicos: logical, numeric, integer, complex, character, raw
* Datos/Factores:
  - Variables continuas
- Variables discretas (nominales/ordinales)
* Reciclado
* Valores especiales, NA, Inf, NULL
* return implícitos
* Evaluación no estándar


## Tipos de datos

# Logical
TRUE != FALSE

# Numeric
x <- 1.0

# Integer
x <- 123L
class(x)

# Complex
sqrt(−1+0i)

# Character
x <- "hola"

## Reciclado

v3 <- runif(20)

v3 + 10
v3 + c(10,20)


## R en Windows

* Path al estilo unix: `file.path("a", "b", "c")`
* Instalación y eventual recompilación de paquetes (`Rtools`)

## No existen los datos escalares

Un escalar es una constante o variable que contiene un dato atómico y
unidimensional. En contraposición al concepto de escalar, están los conceptos de
array (vector), lista y objeto, que pueden tener almacenado en su estructura más
de un valor. El término viene heredado del álgebra lineal –véase Escalar
(matemática)– y se refiere a un dato atómico y unidimensional, en contraposición
al concepto de vector, que se refiere a un dato multidimensional. El origen del
término «escalar» data de los años setenta cuando se quería disponer de un
significado opuesto a «vector», para distinguir la idea de procesado de
vectores, en el diseño de procesadores computacionales.


# Esperamos una cadena escalar
hola <- function(nombre) {
  if (substr(nombre, nchar(nombre), nchar(nombre)) == 'a') {
    paste('Hola Señora', nombre)
  } else {
    paste('Hola Señor', nombre)
  }
}

# Controlamos que sea una cadena única
hola <- function(nombre) {
  if (length(v)!=1) stop("nombre must be a character vector of length 1")
  if (substr(nombre, nchar(nombre), nchar(nombre)) == 'a') {
    paste('Hola Señora', nombre)
  } else {
    paste('Hola Señor', nombre)
  }
}

# O preparamos la función para trabajar sobre vectores
hola_vctr <- function(nombre) {
  ifelse(substr(nombre, nchar(nombre), nchar(nombre)) == 'a',
         paste('Hola Señora', nombre),
         paste('Hola Señor', nombre)
  )
}
v <- "maria"
hola(v)


v <- c("maria", "juan pablo")
hola(v)

hola_vctr(v)


## Herrmientas para buenas prácticas

* **[`renv`][renv]**: Control sobre las dependencias
* **lOGGING**: Registro de actividad
* **[`usethis`][usethis]**: Automatización de tareas repetitivas de desarrollo para un proyecto R.
* **[`assertthat`][assertthat]**: comprobar las condiciones previas y
posteriores de una función
* **[`testthat`][testthat]**: Testeo unitario
* **[`goodpractice`][goodpractice]**: Guías de buenas prácticas
* **[`config`][config]**: Configuración de Shiny, perfile de constantes
* **`covr`**: Análisis de cobertura de código
* **`linter`**: Linting de código


## Control del entorno de desarrollo

* Instalación de Sistema/Usuario/proyecto
* El interprete
* Las librerías o paquetes

### ¿Cómo mantener un entorno consistente entre los ambientes?

1. Instancias locales de R y paquetes sincronizadas manualmente
* Tener script de instalación de dependencias y versiones
2. Proyectos de Rstudio Cloud con la paquetería apropiada
4. [`renv`][renv] (antes `packrat)
5. `docker`

Instalación de versión específica

require(devtools)
install_version("ggplot2", version = "0.9.1", repos = "http://cran.us.r-project.org")


### Entornos Virtuales [renv][renv]

* control dependencias
* Reproducibilidad
* Facilita el despliegue al tener inventariado todas las dependencias
* cache global, carga rápida
* `renv::init()`
* `renv::snapshot()`
* `renv::restore()`
* Modo explícito/I  mplícito/Todo
* Analiza código del proyecto para detectar dependencias
* dependencies.R
* DESCRIPTION
* Se puede determinar versión de R, pero no hay automatización de esto


### logging

* [logger][logger]
* [log4r][log4r]
* [lgr][lgr]
* [dyn.log][dyn.log]
* [futile.logger][futile.logger]


### [`usethis`][usethis]

Automatización de tareas repetitivas de desarrollo.
[(Ver)](https://usethis.r-lib.org/index.html).


### Assertions

* Asegurar ciertas condiciones o supuestos
* Útil en el desarrollo inicial, en especial si hay multiples colaboradores
* Por lo general se usan durante el desarrollo pero se quitan en producción
* En el caso de R suelen dejarse por que siguen siendo útiles en paquetes
* Función base `stopifnot()` detiene la ejecución de la función

Ejemplos

library(assertthat)

x <- "x"
x <- 1:10

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


### [`goodpractice`][goodpractice]

Dar consejos sobre buenas prácticas al construir paquetes R. Los consejos incluyen funciones y sintaxis a evitar, estructura del paquete, complejidad del código, formateo del código, etc.

install.packages("goodpractice")

# Informe general
library(goodpractice)
gp("<my-package>")

# Ver los checks disponibles
all_checks()

# ejecutar solo ciertos checks
checks <- gp(pkg_path, checks = "description_url")
checks

# Que checks se ejecutaron/fallaron
checks(checks)
failed_checks(checks)

# Resultados
results(g)

### [`testthat`][testthat]

Testeo unitario, creado por Hadley Wickham en el 2009, y usado extensivamente
por miles de paquetes. En el 2020 se incorporaron varias funcionalidades y
mejoras que eventualmente "rompen" codigo existente, pero se puede optar por
usar las nuevas versiones con la compatibilidad hacia atrás o la nueva
"edición".

install.packages("testthat")

La edición 3 que es recomendable implementar hace uso del paquete [`waldo`][waldo] que es una API para comparación de objetos R que ofrece una mejor experiencia de usuario.

El uso de la edición 3 se hace indicando la cadena `Config/testthat/edition: 3` en el archivo `DESCRIPTION` del paquete, o eventualmente invocando la función `testthat::set_edition(3)` en el script de inicialización.

#### Ejemplos de `expect_equal()` y `expect_identical()`:

local_edition(2)
local_edition(3)

expect_equal(mtcars[-1], mtcars)

f1 <- factor(letters[1:3])
f2 <- factor(letters[1:3], levels = letters[1:4])

f1
f2

expect_equal(f1, f2)

expect_identical(1/3 + .1 - .1, 1/3)
expect_identical(1/3 + .1 -. 1, 1/3, tolerance = testthat_tolerance())


#### **Snapshot** testing

* Captura los casos de prueba en una archivo externo .md
* La verificación posterior se hace contra ese archivo
* Ideal para comparaciones complejas
* Salida .Md pensada para compartir en github
* puede tener múltiples "expectations"
* Se debe incluir los .md  en el paquete
---
  
  mi_funcion <- function() {
    library(ggplot2)
    g <- ggplot(data=mtcars, mapping=aes(mpg, cyl)) + geom_point()
    toString(g)
  }

test_that("mi función funciona!", {
  local_edition(3)
  out <- mi_funcion()
  expect_snapshot_output(out)
})

# snapshot_accept('mi_funcion')
# snapshot_review("mi_funcion") # Instalar shiny y diffviewer


#### ¿y por que no validar los gráficos?

library(vdiffr)
test_that("ggplot2 histogram", {
  p <- ggplot(mtcars) + geom_histogram(aes(hp))
  expect_doppelganger("default histogram", p)
})

#### Parallel

Para habilitarlo, nuevamente en el archivo `DESCRIPTION` del paquete, se debe
indicar la cadena `Config/testthat/parallel: true`, o eventualmente invocando la
función `testthat::set_parallel(TRUE)` en el script de inicialización.

* Puede mejorar la performance cuando el número de tests es importante
* Hay un overhead por la carga eventual de entornos y paquetes
* Cuidado con los tests que dependen de un orden o de una inicialización previa

### [`config`][config]

* Extracción de constantes asociados a Perfiles (dev/test/prod)
* Evita el hardcoding
* Centralización de constantes
* Mejora calidad

Comandos

Sys.setenv(R_CONFIG_ACTIVE = "desa")
cfg <- config::get(file="config.yml")









# Material bibliográfico y otros

## Libros

* [R for Data Science by Hadley Wickham and Garrett Grolemund][r4ds-en]: Para el
que comienza en R y en Data Science, este tal vez debiera ser el primer
libro a leer, existe [una versión en español][r4ds-es] realizada por la
comunidad hispanohablante
* [R packages by Hadley Wickham and Jenny Bryan.][r-package]: El abc de la
creación de paquetes en R

* [Advanced R by Hadley Wickham][advanced-r]: Tópicos avanzados de R
* [The R Inferno by Patrick Burns][r-inferno]: Un libro sobre puntos problemáticos, rarezas, trampas, fallas en R. Tiene muchos años pero sigue siendo una referencia.

## Otros

* [The tidyverse style guide][tidy-style]

[renv]: https://rstudio.github.io/renv/articles/renv.html
[testthat]: https://testthat.r-lib.org/
  [r-inferno]: https://www.burns-stat.com/pages/Tutor/R_inferno.pdf
[usethis]: https://github.com/r-lib/usethis
[r-package]: https://r-pkgs.org/index.html
[tidy-style]: https://style.tidyverse.org/index.html
[r4ds-en]: https://r4ds.had.co.nz/
  [r4ds-es]: https://es.r4ds.hadley.nz/
  [advanced-r]: https://adv-r.hadley.nz/
  [waldo]: https://www.tidyverse.org/blog/2020/10/waldo/
  [goodpractice]: https://github.com/MangoTheCat/goodpractice
[assertthat]: https://github.com/hadley/assertthat
[config]: https://cran.r-project.org/web/packages/config/vignettes/introduction.html
[logger]: https://github.com/daroczig/logger
[log4r]: https://github.com/johnmyleswhite/log4r
[lgr]: https://github.com/s-fleck/lgr/
  [dyn.log]: https://github.com/bmoretz/dyn.log
[futile.logger]: https://github.com/zatonovo/futile.logger
