Visualizing Noise and Filtering in Image Data
========================================================
author: Dr. Zed ("Almost Dead?! I can fix that.")
date: July 26, 2015

Submitted for Coursera Data Science 9 - Developing Data Products

This is a simple example Shiny app to look at some of the capabilities of visulizing basic image processing tasks.  I chose to use the filtering of a random noise image as a test of the impact and responsiveness of Shiny with images.  While a very simple task, it shows that a large number of the basic building blocks of image processing are possible within this framework.  The biggest restriction will be the size of the image itself.  Here I optimized at 300 x 300, which is pretty small, but manages to be able to demonstrate the relevant features without being too slow.  

The app consists of two input controls, each sliders, that provide parameters for the standard deviation of the pixel intensity, taken from a zero mean normal distribution, and for the effective width of the gaussian image smoothing kernel.  The spatstat package blur function is used to do the convolution and the output is offset by 0.5 and saved as a png (which takes input on the range 0..1).  The resulting png is displayed in the main panel.

Nothing particularly complicated here.  It would be straightforward to implement a number of other typical image processing tasks in this way.  