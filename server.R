# Introstat exercises - type 2

# Server logic
# the server handles:

# 1) execution of user inputted code

# 2016 Tuomo A Nieminen

library(shiny)
source("exercise_data.R")

Run <- function(codetextInput){
  eval(parse(text=codetextInput))
}

shinyServer(function(input, output) {
  
# Exercise data
  observeEvent(input$start, {
    reactive_data <<- reactive({
      getData(input$theme,input$student_id)
    })
    D <<- reactive_data()
  })
  
  # React to the Playground code inputs
  observeEvent(input$execute, {
    code <- input$code
    type <- input$codetype
    output[[type]] <- switch(type,
                             "plot" =  renderPlot({Run(code)}),
                             "table" = renderTable({Run(code)}),
                             "text" = renderPrint({Run(code)})
    )
  })  
  
  
  
})
