library(ggplot2)
library(CodeClanData)
library(dplyr)
library(shiny)

ui <- fluidPage(
    fluidRow(
        column(6,
               radioButtons('gender',
                            'Male or Female Dogs?',
                            choices = c("Male", "Female"))
        ),
        column(6,
               selectInput("breed",
                           "Which Breed?",
                           choices = unique(nyc_dogs$breed))
        )
    ),
    fluidRow(
        column(6,
               plotOutput("colour_barchart")
        ),
        column(6,
               plotOutput("borough_barchart")
        )
    )
)
server <- function(input, output) {
    
    filtered_data <- reactive({
        nyc_dogs %>%
            filter(gender == input$gender)  %>%
            filter(breed == input$breed)
    })
    
    output$colour_barchart <- renderPlot({
        filtered_data() %>%
            ggplot +
            geom_bar(aes(x = colour)) 
    })
    output$borough_barchart <- renderPlot({
        filtered_data() %>%
            ggplot +
            geom_bar(aes(x = borough)) 
    })
}
shinyApp(ui = ui, server = server)
