# Introstat exercises - type 2

# Global R objects
# objects:

# 1) exercise tabs creation

# 2016 Tuomo A Nieminen

D <- "Please initialize the exercise at the start panel"

source("exercises.R")

# a list containing the exercise tabs
exerciseContentTabs <- lapply(1:length(Exercises), function(i) {
  
  Ex <- Exercises[[i]]  
  objective <- div( class = 'learning_objective', p(Ex[["o"]]) )
  question <- div( class = 'question', p(Ex[["q"]]) )
  
  ansId <- paste0("answer",i)
  ansbox <- switch(Ex[["atype"]],                   
                   "txt" = textInput(ansId, label = "Answer"),
                   "numeric" = numericInput(ansId, label = "Answer")
  )
  
  tabTitle <- paste("Exercise",i)

  # create an exercise tab
  do.call(tabPanel,
          list(title = tabTitle, h3(tabTitle),
               hr(), h4("Learning objective"), objective,
               hr(), h4("Assignment"), question, 
               hr(), ansbox))
})

