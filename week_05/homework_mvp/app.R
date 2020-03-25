library(shiny)
library(dplyr)
library(tidyverse)
library(CodeClanData)

source("mini_via.R")


ui <- fluidPage(
    theme = shinytheme("flatly"),
    
    titlePanel(tags$h1("Five Country Medal Comparison")),
    
    sidebarLayout(
        sidebarPanel(
            radioButtons("season",
                         "Summer or Winter Olympics?",
                         choices = c("Summer", "Winter")
            ),
        ),
        
            radioButtons("medal",
                         "medal colour?",
                         choices = c("Gold", "Silver", "Bronze")
            ),

        tabPanel("Which team?",
                 
                 selectInput("team",
                             "Which Team?",
                             choices = all_teams,
                             selected = "Great Britain"
                 )
                 
        ),
        
        mainPanel(
            "Main"
        )
    )
)

server <- function(input, output) {
    
}

shinyApp(ui = ui, server = server)












