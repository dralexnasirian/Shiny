##############################
# application for setting a number (x) between 1 and 50 
# and (y) between 1 and 50
# then return the product
##############################

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  sliderInput(inputId = "x", label = "if the x is: ",min = 1, max = 50,value = 30),
  sliderInput(inputId = "y", label = "if the y is: ",min = 1, max = 50,value = 30),
  "then x * y is : ", textOutput("product")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  xy <- reactive({
    input$x * input$y
  })
  
  output$product <- renderText({
    xy()
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
