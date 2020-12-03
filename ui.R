#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#    Autor : Henrys kasereka
#    Email : arisjokov@gmail.com

library(shiny)

# UI
shinyUI(fluidPage(
    
    titlePanel("Based on distance we calculate the cost of gasoline using mtcar's data"),
    
    sidebarLayout(
        sidebarPanel(
            hr(),
            h3("Parameter:"),
            checkboxGroupInput('cyl', 'Cylinder Numbers:', c("Four"= 4, "Six"= 6, "Eight"= 8), selected = c(4,6,8)),
            checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1)),
            hr(),
            h3("Distance traveled:"),
            numericInput('distance', 'Distance in miles ', 50, min = 1, max = 100000),
            numericInput('cost', 'Gasoline Price $ per gallon:', 3.700),
            hr()
        ),
        mainPanel(
            dataTableOutput('datatable')
        )
    )
))