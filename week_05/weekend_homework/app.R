library(shiny)
library(dplyr)
library(ggplot2)
library(CodeClanData)
library(shinythemes)
all_teams <- unique(olympics_overall_medals$team)

ui <- fluidPage(
    titlePanel("Game Sales Insights"),
    
    fluidRow(
        column(6,
               radioButtons("publisher", 
                            "Which publisher are you interested in?", 
                            choices = c("Nintendo", "Other")
               )
        ),
        column(6,
               selectInput("game",
                           "Which Game?",
                           choices = name,
                           selected = "Assassin's Creed"
                           
               )
               
        ),
        
        fluidRow(plotOutput("game_score"))
    )
)
server <- function(input, output) {
    
    output$medal_plot <- renderPlot({
        ggplot(game_sales) +
            geom_tile(aes(x = name, y = critic_score, fill = user_score)) +
            scale_color_gradient(low = "yellow", high = "magenta")
    })
}
shinyApp(ui = ui, server = server)