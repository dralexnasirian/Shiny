

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  textInput("name", "what's your name?"),
  textOutput("greeting")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$greeting <- renderText({
    paste0("hello ", input$name, "!")
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
