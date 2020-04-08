library(shiny)
library(dplyr)
library(ggplot2)
library(CodeClanData)
library(shinythemes)

all_teams <- unique(olympics_overall_medals$team)

ui <- fluidPage(
    theme = shinytheme("cerulean"),
    
    titlePanel(tags$h2("Five Country Medal Comparison")),
    
    tabsetPanel(
        tabPanel("The Big 5",
    
    fluidRow(
        column(4,
               
            radioButtons("season",
                         tags$h5("Summer or Winter Olympics?"),
                         choices = c("Summer", "Winter")
                         
            ),
            
            radioButtons("medal",
                         tags$h5("What colour of medal?"),
                         choices = c("Gold", "Silver", "Bronze")
                         
            ),
        ),
        
        column(8,
            plotOutput("five_country_plot"),
            tags$a("All time Olympic Games Medal Table", href = "https://en.wikipedia.org/wiki/All-time_Olympic_Games_medal_table")
        )
    ),
    
        
    
    ),
    
    tabPanel("All teams",
             
             selectInput("team",
                         "Which Team?",
                         choices = all_teams,
                         selected = "Great Britain"
             ),   
             
             
    )
)
    
)

server <- function(input, output) {
    
    output$five_country_plot <- renderPlot({
        
        olympics_overall_medals %>%
            filter(team %in% c("United States",
                               "Soviet Union",
                               "Germany",
                               "Italy",
                               "Great Britain")) %>%
            filter(medal == input$medal) %>%
            filter(season == input$season) %>%
            ggplot() +
            aes(x = team, y = count, fill = team) +
            geom_col()
        
    })
    
}

shinyApp(ui = ui, server = server)








