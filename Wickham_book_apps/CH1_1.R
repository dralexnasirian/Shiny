
library(shiny)

# UI
ui <- fluidPage(
  selectInput("dataset", "Dataset", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)

# Server
server <- function(input, output) {
  output$summary <- renderPrint({
    dataset <- get(input$dataset , "package:datasets")
    summary(dataset)
  })
  
  output$table <- renderTable({
    dataset <- get(input$dataset, "package:datasets")
    dataset
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
