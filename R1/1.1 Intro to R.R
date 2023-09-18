# Introduction to R
" 1.1 Comment "

# One line comment
# Another comment

'
  multiple
  line
  comment
'

" 1.2 Installing and loading R packages "
install.packages("tidyverse")
install.packages("ggplot2")


# Loading the objects of tidyverse library in session
library(tidyverse)
library(ggplot2)


5-2
4/2
2*2
2^2
1e-16

" 1.4 Variable declaration Exercise "
# 1. Assign value 2 to a
a <- 2
a = 2


# 2. Assign value "2" to b
b <- "2"

my_name <- "Varman"


class(a)
class(b)
typeof(T)

10 > 2
5 < 6
6 <= 6
(10-8) == 2

# ! = not

!TRUE

# | 

(FALSE | TRUE)

(FALSE | FALSE)

TRUE & FALSE

TRUE & TRUE

(FALSE | TRUE) & FALSE

" 1.5 Data types exercise "
# Identify if each of the following are numerical
typeof(1)
typeof(1e-12)
typeof("abcd")
typeof(TRUE)


" 1.5.2 Logical Values Exercise: "
# Evaluate the result of following expressions

(FALSE || TRUE) && FALSE 

(TRUE && FALSE) && TRUE 

(!FALSE || FALSE)


tolower(my_name)
toupper(my_name)
nchar(my_name)

paste("R", "is Awesome!!")

# 1.6 Functions

# Name of the function "<-" function(parameters...) {what the function does!}

add <- function(x, y) {
  x + y
} 

add(1,2)



## Built-in functions

sqrt(4)

log(100,10)
log(x, base)

log(216,6)

