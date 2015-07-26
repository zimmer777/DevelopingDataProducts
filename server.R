
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(png)
library(spatstat)
library(shiny)

shinyServer(function(input, output) {
  
  # this image output taken from http://shiny.rstudio.com/gallery/image-output.html
  # image1 creates a new PNG file each time Radius changes
  output$image1 <- renderImage({
    # Set width and height of image1

    
    width<-300
    height<-300
    
    # A temp file to save the output.
    # This file will be automatically removed later by
    # renderImage, because of the deleteFile=TRUE argument.
    outfile <- tempfile(fileext = ".png")
    
    # Generate the image with slider input sigma

    pic <- matrix(rnorm(width*height,mean=0.5,sd=input$sigma),height,width)
    
    # blur it with gaussian kernel using spatstat blur
    pic <- as.matrix(blur(as.im(pic),sigma=input$filterWidth))
    
    # write png
    writePNG(pic, target = outfile)
    
    # Return a list containing information about the image
    list(src = outfile,
         contentType = "image/png",
         width = width,
         height = height,
         alt = "This is alternate text")
    
  }, deleteFile = TRUE)
  


})
