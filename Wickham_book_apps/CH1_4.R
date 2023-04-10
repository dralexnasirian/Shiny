##############################
# application for setting a number (x) between 1 and 50 and display the result 
# by multiplying it by 5
##############################

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  sliderInput(inputId = "x", label = "if the x is: ",min = 1, max = 50,value = 30),
  textOutput("product")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$product <- renderText({
    input$x * 5
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
