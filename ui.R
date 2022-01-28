library(shiny)
library(leaflet)
library(ggplot2)
library(scales)
library(dplyr, warn.conflicts = FALSE)
library(ggthemes)

data <- read.csv("./Data/processed_df.csv")
#to remove scientific notation for numbers
options(scipen = 999)
choices <- c("All",data$Area)

ui <- fluidPage(
  #theme = shinytheme("sandstone"),
  theme = theme_light(),
  navbarPage("Real Estate Property Analysis",
             tabPanel("Visualization",
                      sidebarLayout(
                        
                        sidebarPanel(
                          h4("Config for Univariate Analysis:"),
                          selectInput("var_uni", "Variable :", choices = c("Area","Price_RM","Size_sqft")),
                          h4("Config for Bivariate Analysis:"),
                          selectInput("var", "For X-axis :", choices = c("Area","Price_RM", "Size_sqft")),
                          selectInput("var2", "For Y-axis :", choices = c("Price_RM", "Size_sqft")),
                          selectInput("areafilter", "Area :", choices = choices ,multiple=TRUE,selected = "All"),
                          sliderInput("price", "Price :", min = 20000, max = 4000000, value = c(20000,4000000)),
                          sliderInput("size", "Size sqft :", min = 250, max = 5000, value = c(250,5000)),
                          verbatimTextOutput("Selected")
                          
                        ),
                        
                        
                        # Show a plot of the generated distribution
                        mainPanel(
                          fluidRow(
                            leafletOutput("mymap"),
                            hr(),
                            splitLayout(cellWidths = c("30%", "55%"), print(h4("Univariate Analysis")), print(h4("Bivariate Analysis"))),
                            splitLayout(cellWidths = c("30%", "55%"), plotOutput("plot2"), plotOutput("plot"))
                          )
                        )
                      )),
             
             tabPanel('Documentation', includeMarkdown("./Data/Intro.md")),
             
  ),
  
  
)