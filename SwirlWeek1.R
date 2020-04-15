install.packages("swirl")

packageVersion("swirl")

library(swirl)

install_from_swirl("R Programming")

swirl()
# When you are at the R prompt (>):
#   | -- Typing skip() allows you to skip the current question.
# | -- Typing play() lets you experiment with R on your own; swirl will ignore what you
# | do...
# | -- UNTIL you type nxt() which will regain swirl's attention.
# | -- Typing bye() causes swirl to exit. Your progress will be saved.
# | -- Typing main() returns you to swirl's main menu.
# | -- Typing info() displays these options again.
# 
# | Let's get started!

mad_libs <- function(...){
  # Do your argument unpacking here!
  args <- list(...)
  place <- args[["place"]]
  adjective <- args[["adjective"]]
  noun <- args[["noun"]]
  # Don't modify any code below this comment.
  # Notice the variables you'll need to create in order for the code below to
  # be functional!
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}
# Hadley Wickham's Journal of Statistical Software paper titled
# | 'The Split-Apply-Combine Strategy for Data Analysis'

# You're familiar with adding, subtracting, multiplying, and dividing numbers in R. To
# | do this you use the +, -, *, and / symbols. These symbols are called binary operators
# | because they take two inputs, an input from the left and an input from the right.


####dim dataframe
dim(flags)

cls_list <- lapply(flags, class)

as.character(cls_list)

shape_mat <- sapply(flag_shapes, range)
lapply(unique_vals, function(elem) elem[2])

f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}

z = 10

x <- 5
y <- if(x < 3) {
  NA
} else {
  10
}

tapply(flags$animate, flags$landmass, mean)

tapply(flags$population,flags$red, summary)

#### email address: olaniyi.oyeniyi28@gmail.com

dim(plants)

object.size(plants)

table(plants$Active_Growth_Period)

flips <- sample(c(0,1), 100, replace = TRUE, prob = c(0.3, 0.7))

# Anytime that you load up a new data frame, you should explore it before using it. In
# | the middle of a swirl lesson, just type play(). This temporarily suspends the lesson
# | (without losing the work you have already done) and allows you to issue commands like
# | dim(mtcars) and head(mtcars). Once you are done examining the data, just type nxt()
# | and the lesson will pick up where it left off.

