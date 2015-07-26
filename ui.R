
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Visualize Noise in an Image"),

  # Sidebar with a slider input for noise st dev and filter width
  sidebarLayout(
    sidebarPanel(
      sliderInput("sigma", "Noise Sigma:", min = 0.01, max = 3.0,
                value = 0.1, step = 0.01),
      sliderInput("filterWidth", "Filter Width:", min = 0.2, max = 5,
                value = 1, step = 0.1)
    ),
    # Show a png image of output
    mainPanel(
        imageOutput("image1")
    )
  )
))
