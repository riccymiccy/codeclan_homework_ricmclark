library(ggplot2)
library(CodeClanData)
library(dplyr)
library(shiny)

ui <- fluidPage(
    
    titlePanel("Reaction Time vs Memory Game"),
    
    sidebarLayout(
        sidebarPanel(
            radioButtons("colour",
                            "Colour of points",
                            choices = c(Blue = "#3891A6", Yellow = "#FDE74C", Red = "#E3655B")
                         
                ),

        
            sliderInput("trans_p",
                             label = h3("Transparency of points"),
                             min = 0, max = 1, value = 0.7),


            selectInput("shape",
                            label = h3("Shape of points"),
                            choices = c("Square" = 15, "Circle" = 16, "Triangle" = 17)
                        
                )
    ),
        
    
    mainPanel(
        plotOutput("mem_react_chart")
    )
    
    )
    
)
    
        

    

server <- function(input, output) {
    
    
    
    output$mem_react_chart <- renderPlot({
        students_big %>% 
            ggplot() +
            aes(x = reaction_time, y = score_in_memory_game) +
            geom_point() 
    })
    
    
}
shinyApp(ui = ui, server = server)