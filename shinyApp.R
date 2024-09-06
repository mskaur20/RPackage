
library(shiny)

ui <- fluidPage(
  titlePanel("Shiny App with Game and Statistics"),

  sidebarLayout(
    sidebarPanel(
      textInput("name", "Enter your name:", value = "User"),
      selectInput("variable", "Choose a variable:", choices = names(mtcars)),
      numericInput("guess", "Guess the variance of the selected column:", value = 0, step = 0.1)
    ),

    mainPanel(
      tabsetPanel(
        tabPanel("Welcome",
                 h3("Current user:"),
                 textOutput("current_user")),

        tabPanel("Summary Statistics",
                 h3("Summary statistics for the selected variable:"),
                 textOutput("mean"),
                 textOutput("min"),
                 textOutput("max")),

        tabPanel("Variance Guessing Game",
                 h3("Guess the variance:"),
                 textOutput("variance_response"))
      )
    )
  )
)


server <- function(input, output) {


  output$current_user <- renderText({
    paste("Current user:", input$name)
  })



  output$mean <- renderText({
    var <- mtcars[[input$variable]]
    paste("Mean:", mean(var))
  })

  output$min <- renderText({
    var <- mtcars[[input$variable]]
    paste("Min:", min(var))
  })

  output$max <- renderText({
    var <- mtcars[[input$variable]]
    paste("Max:", max(var))
  })


  output$variance_response <- renderText({
    var <- mtcars[[input$variable]]
    actual_variance <- var(var)
    guess <- input$guess

    if (abs(actual_variance - guess) < 0.1) {
      "Great guess! You're really close!"
    } else if (guess > actual_variance) {
      "Your guess is too high!"
    } else {
      "Your guess is too low!"
    }
  })
}


shinyApp(ui = ui, server = server)



