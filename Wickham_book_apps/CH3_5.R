
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    fluidRow(
        column(3,
               numericInput("lambda1","lambda1",value = 3),
               numericInput("lambda2","lambda2",value = 5),
               numericInput("n","n",value = 1e3,min = 0)
               ),
        column(9,
               plotOutput("hist")
               )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
    
    timer <- reactiveTimer(1000)
    
    x1 <- reactive({
        timer()
        rpois(input$n, input$lambda1)
    })
    
    x2 <- reactive({
        timer()
        rpois(input$n, input$lambda2)
    })
    
    output$hist <- renderPlot({
        freqpoly(x1(), x2(), binwidth = 1, xlim = c(0,40) )    
    })

}

# Run the application 
shinyApp(ui = ui, server = server)
