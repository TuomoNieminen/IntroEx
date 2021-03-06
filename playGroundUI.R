# Introstat exercises - type 2

# UI for The Playground
# the playground user interface includes:

# 1) text area for inputting code
# 2) radio buttons to choose the type of output
# 3) output as text, plot or table

# 2016 Tuomo A Nieminen


div(
  
# code input
  div(tags$textarea(id="code",
                    rows=5, cols=90,
                    "# write any (R) code here")),
  br(),
  
  
# code type
  radioButtons("codetype",
               label = "Choose output type",
               choices = list("numeric / basic print" = "text",
                              "plot" = "plot",
                              "table" = "table"),
               selected = "text"),
  
  
# code execution
  actionButton("execute","Go!"),
  br(),br(),
  
  
# output
  conditionalPanel(
    condition="input.codetype=='text'",
    verbatimTextOutput("text")
  ),
  conditionalPanel(
    condition="input.codetype=='plot'",
    plotOutput("plot")
  ),
  conditionalPanel(
    condition="input.codetype=='table'",
    tableOutput("table")
  )
)