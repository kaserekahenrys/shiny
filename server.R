#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#    Autor : Henrys kasereka
#    Email : arisjokov@gmail.com

library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
    
    output$datatable <- renderDataTable({
        data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg, CostofGasoline = input$distance/mpg*input$cost, Cylinders = cyl, Transmission = am)
        data <- filter(data, Cylinders %in% input$cyl, Transmission %in% input$am)
        data <- mutate(data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
        data <- arrange(data, CostofGasoline)
        data
    }, options = list(lengthMenu = c(4, 8, 16), pageLength = 16))
})