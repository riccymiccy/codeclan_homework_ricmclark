library(ggplot2)
library(CodeClanData)
library(dplyr)
library(shiny)

ui <- fluidPage(
  fluidRow(
    column(12,
           radioButtons("age",
                        "Age",
                        choices = 10:18, inline = TRUE)
    ),
    
  ),
  fluidRow(
    column(6,
           plotOutput("stud_height_chart")
    ),
    column(6,
           plotOutput("stud_arm_chart")
    )
  )
)
server <- function(input, output) {
  
  
  
  output$stud_height_chart <- renderPlot({
    students_big %>% 
      filter(ageyears == input$age) %>% 
      ggplot() +
      aes(x = height) +
      geom_histogram() 
  })
  
  output$stud_arm_chart <- renderPlot({
    
    students_big %>% 
      filter(ageyears == input$age) %>% 
      ggplot() +
      aes(x = arm_span) +
      geom_histogram()
    
  })
}
shinyApp(ui = ui, server = server)