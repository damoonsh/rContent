"
    This app is written in Shiny package. 
    The purpose of the app is to stimulate how does
    a Regression model work.
    
    Email trsmbootcamps for suggestions.
"

library(shiny)
library(ggplot2)
library(tidyverse)
gen_numbers <- function(avg1, avg2, sd1, sd2, n=100) {
    rnorm(n, avg1, sd1) + rnorm(n,avg2, sd2)
}

x1 <- gen_numbers(10, 2, 5e-1, 1e-1)
x2 <- gen_numbers(-1.1, 1, 9e-1, 1e-3)
x3 <- gen_numbers(6, 1e-1, 10.5, 0.001)
x4 <- gen_numbers(-1, 2e-1, 2, 1e-1)
x5 <- gen_numbers(4, -5e-1, 0.5, 3e-1)
y <- 2 * x1 - 4 * x2 + 3 * x3 - 7 * x4 + 8 * x5 + gen_numbers(1, 5e-1, 0.1, 0.01)

a <- data.frame(x1=x1,
                x2=x2,
                x3=x3,
                x4=x4, 
                x5=x5,
                y=y)

# housing_df <- read_csv("https://www.dropbox.com/s/tvvtf9dwjufo7os/housing_train.csv?dl=1")
# features <- c("MSSubClass", "LotFrontage", "LotArea", "OverallQual", "OverallCond", "YearBuilt")
# 
# 
# housing_df$LotFrontage <- replace_na(housing_df$LotFrontage, 
#                                      mean(housing_df$LotFrontage, na.rm=TRUE))
# 
# for (feature in features) {
#     if (anyNA(housing_df[[feature]])) {
#         housing_df[[feature]] <-
#             replace_na(housing_df[[feature]], mean(housing_df[[feature]], na.rm=T))
#     }
#     
#     housing_df[[feature]] <- (housing_df[[feature]] - mean(housing_df[[feature]])) / sd(housing_df[[feature]])
# }
# 
# X <- housing_df %>% select(features)
# Y <- housing_df %>% select(SalePrice)

# train_size <- floor(nrow(housing_df) * 0.8)
# train_indexes <- sample(seq_len(nrow(housing_df)), size=train_size)
# x_train <- housing_df[train_indexes, features]
# x_val <- housing_df[-train_indexes, features]

# Define UI 
ui <- fluidPage(
    tabsetPanel(
        tabPanel("Instructions",
            mainPanel(    
                h3("Purpose of Stimulator"),
                h5("This stimulator aims to provide an interactive environment 
                   to demonstrate how Regression work. They are five features 
                   (x1, x2, x3, x4, x5) available where the weight for each can 
                   be tweaked via the sliders. After modifying the weights, try 
                   to observe how the line is fitting the plotting."),
                h2("Process:"),
                h4("1. Start from the first slide and move it around to minimize the error."),
                h4("2. Observe the graph is getting more accurate!"),
                h4("3. Move to the next slider and do the same thing."),
            )
        ),
        tabPanel("Stimulator",
            # Application title
            titlePanel("Regression Stimulator"),
            
            
            column(5,
                fluidRow(sliderInput("x1", "x1:", min=-10, max=10, value=0)),
                fluidRow(sliderInput("x2", "x2:", min=-10, max=10, value=0)),
                fluidRow(sliderInput("x3", "x3:", min=-10, max=10, value=0)),
                fluidRow(sliderInput("x4", "x4:", min=-10, max=10, value=0)),
                fluidRow(sliderInput("x5", "x5:", min=-10, max=10, value=0))
            ),
            
            column(7,
                fluidRow("Error is", verbatimTextOutput("error"), 
                checkboxInput("sort", 'Sort?', value = FALSE, width = NULL)),
                fluidRow(plotOutput("plot"),
            )
            
        )
    )
)
)


# Server
server <- function(input, output) {
    weights <- reactive({
        c(input$x1, 
          input$x2,
          input$x3, 
          input$x4, 
          input$x5)
    })
    
    y_pred <- reactive({
        t(t(as.matrix(weights())) %*% t(as.matrix(a[,1:5])))
    })
    
    y <- reactive({
        if (input$sort) {
            data.frame(yp=y_pred(), yt=a[,6]) %>% arrange(yt)
        } else {
            data.frame(yp=y_pred(), yt=a[,6])
        }
    })
    
    output$error <- reactive({
        sum(abs(a[,6] - y_pred())) / 100
    })
    
    output$plot <- renderPlot({
        y() %>%
            ggplot(aes(x=1:100)) + 
                geom_point(aes(y=yt, color="Actual Y")) + 
                geom_line(aes(y=yp, color="Prediction Y")) +
                xlab("Entries") + ylab("Y")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
