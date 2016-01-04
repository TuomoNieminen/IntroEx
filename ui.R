# Introstat exercises - type 2

# UI logic
# the user interface includes:


# 0) A initialization page
# 1) A wellcome tab
# 2) A playground tab where the user can 'play' with R
# 3) Exercise tabs, which include the actual exercises

# 2016 Tuomo A Nieminen

library(shiny)

shinyUI(fluidPage(
  
# initialization (student ID and theme choice)  
  conditionalPanel(condition = "input.start%2==0",
                   hr(),
                   p("Please fill in the information below."),
                   hr(),
                   numericInput("student_id",
                                label ="Your student ID",
                                value = 123456789),
                   br(),
                   selectInput("theme", label = "Choose your interest",
                               choices = list("Social sciences",
                                              "Natural sciences",
                                              "Biology",
                                              "Medicine"),
                               selected = "Social sciences"
                   ),
                   br(),
                   actionButton("start","Ok, I'm ready!")
  ),

# The rest of the UI (shown only after initialization)  
  conditionalPanel(condition="input.start%2 != 0",
                   tabsetPanel(
                     
                     # wellcome tab
                     tabPanel("Start",
                              
                              h1(class="main_title","Main title"),
                              hr(),
                              p("General information about the exercise set.")
                     ),
                     
                     # playground tab
                     tabPanel("Playground",
                              br(),
                              sidebarLayout(
                                
                                # instructions     
                                sidebarPanel(
                                  p("The playground is a place to try anything with R"),
                                  p(em("Instructions and simple examples")),
                                  p(code("myVar <- 'Hello world!'")),
                                  br(),
                                  br()
                                ),
                                
                                # the playground
                                mainPanel(
                                  source("playGroundUI.R",local=TRUE)$value
                                )                                
                              )
                              
                     ),
                     
                     # exercise tabs                        
                     do.call(navbarMenu,
                             c(list(title="Exercises"), exerciseContentTabs)
                     )
                     
                   ))
  
))