
library(shiny)

# UI
ui <- fluidPage(
  selectInput("dataset", "Dataset", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)

# Server
server <- function(input, output) {

  
  dataset <- reactive({
    get(input$dataset, "package:datasets")
  })
  
  output$summary <- renderPrint({
    summary(dataset())
  })
  
  
  output$table <- renderTable({
    dataset()
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
