#####################################
# freqpoly
freqpoly <- function(x1, x2, binwidth=0.1 , xlim=c(-3,3) ){
    df <- data.frame(
        x=c(x1,x2),
        g=c( rep("x1", length(x1) ), rep("x2", length(x2)) )
    )
    
    ggplot(df, aes(x=x, colour=g)) +
        geom_freqpoly(binwidth=binwidth,size=1)+
        coord_cartesian(xlim=xlim) + theme_dark()
    
}

freqpoly(x1,x2)
#####################################
# t_test

t_test <- function(x1,x2){
    test <- t.test(x1,x2)
    sprintf(
        "p value %0.3f\n[%0.2f, %0.2f]",
        test$p.value, test$conf.int[1], test$conf.int[2]
    )
}

cat(t_test(x1,x2))

########################################
# library
# library(shiny)

##########################################
# UI
ui <- fluidPage(
  fluidRow(
        # column 1
        column(4, 
               "Distribution 1", 
               numericInput("n1","n",value = 1000,min = 1),
               numericInput("mean1","mean",value = 0,step = 0.1),
               numericInput("sd1","standard deviation",value = 0.5,min = 0.1,step = 0.1)
               ),
        # column 2
        column(4,
               "Distribution 2",
               numericInput("n2","n", value = 1000,min = 1),
               numericInput("mean2", "mean",value = 0,min = 0.1),
               numericInput("sd2", "standard deviation", value = 0.5,min = 0.1,step = 0.1)
               ),
        # column 3
        column(4,
               "Frequency polygon",
               numericInput("binwidth", "bin width", value = 0.1,step = 0.1),
               sliderInput("range", "range", value=c(-3,3), min = -5,max = 5,step = 1 )
               )
  ),
  fluidRow(
      column(9,
             plotOutput("hist")
             ),
      column(3,
             verbatimTextOutput("ttest")
             )
  )
)

##############################################
# SERVER
server <- function(input, output) {
    
    output$hist <- renderPlot({
        x1 <- rnorm(input$n1, input$mean1, input$sd1)
        x2 <- rnorm(input$n2, input$mean2, input$sd2)
        freqpoly(x1,x2,binwidth = input$binwidth, xlim = input$range)
    }, res=96)
    
    output$ttest <- renderText({
        x1 <- rnorm(input$n1, input$mean1, input$sd1)
        x2 <- rnorm(input$n2, input$mean2, input$sd2)
        t_test(x1,x2)
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
