# Literacy in Tamil Nadu
# Designed by Tinniam V Ganesh
# Date : 21 May 2015
# Uses package Shiny
# This project uses shiny to display the literacy in the state of Tamil Nadu.
#  The user needs to click a radio button to choose an option 

shinyUI(
  pageWithSidebar(
    # Set the application title
    headerPanel("A look at literacy in the state of Tamil Nadu (India)"),
    
    # Set the radio buttons
    radioButtons("literacy", "Literacy in the state of Tamil Nadu (TN):",
                 c("Total Males & Females attending educational institutions in TN" = "a",
                   "Percent males  atending institutions in TN" = "b",
                   "Percent females attending institutions in TN " = "c",
                   "Pie chart for Tamil Nadu  of  persons  attending school" = "d")),
    
    # Create main panel
    mainPanel(
      
      # Add reactive text that changes when the user chooses an option
      tags$head(tags$style("#text1{color: blue;
                                 font-size: 16px;
                                 font-style: italic;
                           }"
        )
       ),
      # Reactive output
      textOutput("text1"),
      
      # Plot the output based on the user choice
      plotOutput(outputId = "main_plot", height = "300px")
    )
  )
)