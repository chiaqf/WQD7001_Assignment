library(shiny)
library(leaflet)
library(ggplot2)
library(scales)
library(dplyr, warn.conflicts = FALSE)
library(ggthemes)

r_colors <- rgb(t(col2rgb(colors()) / 255))
names(r_colors) <- colors()

plot_color = "#e69138"
data <- read.csv("./Data/processed_df.csv")
#to remove scientific notation for numbers
options(scipen = 999)
choices <- c("All",data$Area)

server <- function(input, output, session) {
  
  observe({
    if ("All" %in% input$areafilter)
      selected_choices= data$Area
    else
      selected_choices = input$areafilter
    
    updateSelectInput(session, "areafilter", selected = selected_choices)
    
  })
  
  output$plot <- renderPlot({
    data2<- data[data$Price_RM>=input$price[1] & data$Price_RM<=input$price[2] & 
                   data$Size_sqft>=input$size[1] & data$Size_sqft<=input$size[2],]
    
    df3 <- data.frame()
    for (val in input$areafilter){
      df3<- rbind(df3, data2[data2$Area == val,])
    }
    
    data2 <- df3
    
    if(input$var2 == "Price_RM"){
      pp <- ggplot(data2, aes_string(y=input$var,x=data2$Price_RM)) +
        geom_point(colour=plot_color, size=4)+theme_excel_new()+
        theme(axis.text.x = element_text(angle = 45, vjust = 1.1, hjust=1))+
        labs(y=input$var, x = input$var2,title= "Variable comparison")
      pp
      
    }
    else if (input$var2 == "Size_sqft"){
      pp <- ggplot(data2, aes_string(y=input$var,x=data2$Size_sqft)) +
        geom_point(colour=plot_color, size=4)+theme_excel_new()+
        theme(axis.text.x = element_text(angle = 45, vjust = 1.1, hjust=1))+
        labs(y=input$var, x = input$var2,title= "Variable comparison")
      pp
      
    }
    else{
      pp <- ggplot(data2, aes_string(y=input$var,x=data2$Size_sqft)) +
        geom_point(colour=plot_color, size=4)+theme_excel_new()+
        theme(axis.text.x = element_text(angle = 45, vjust = 1.1, hjust=1))+
        labs(y=input$var, x = input$var2,title= "Variable comparison")
    }
    
    
  })
  
  #for univariate
  output$plot2 <- renderPlot({
    data2<- data[data$Price_RM>=input$price[1] & data$Price_RM<=input$price[2] & 
                   data$Size_sqft>=input$size[1] & data$Size_sqft<=input$size[2],]
    
    df3 <- data.frame()
    for (val in input$areafilter){
      df3<- rbind(df3, data2[data2$Area == val,])
    }
    
    data2 <- df3
    
    if (input$var_uni == "Area"){
      pp <- ggplot(data2, aes(x=Area),stat="count") +
        geom_bar(fill = plot_color)+theme_excel_new()+
        theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))+
        labs(y="Freq", x = "Area",title= "Histogram for Area")
      pp
      
    }
    else if(input$var_uni == "Price_RM"){
      pp <- ggplot(data2, aes_string(x=data2$Price_RM),stat="count") +
        geom_histogram(fill = plot_color)+theme_excel_new()+
        theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))+
        labs(y="Freq", x = "Price (RM)",title= "Histogram for Price")
      pp
      
    }
    else {
      pp <- ggplot(data2, aes_string(x=data2$Size_sqft),stat="count") +
        geom_histogram(fill = plot_color)+theme_excel_new()+
        theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))+
        labs(y="Freq", x = "Size sqft",title= "Histogram for Size")
      pp
      
    }
    
  })
  
  
  output$mymap <- renderLeaflet({
    klcc <- icons(
      iconUrl = "https://cdn-icons-png.flaticon.com/512/0/987.png",
      iconWidth = 50, iconHeight = 50
    )
    
    university_malaya <- icons(
      iconUrl = "https://upload.wikimedia.org/wikipedia/en/thumb/6/63/University_of_Malaya_coat_of_arms.svg/1200px-University_of_Malaya_coat_of_arms.svg.png",
      iconWidth = 21, iconHeight = 29
    )
    
    data2<- data[data$Price_RM>=input$price[1] & data$Price_RM<=input$price[2] & 
                   data$Size_sqft>=input$size[1] & data$Size_sqft<=input$size[2],]
    
    df3 <- data.frame()
    for (val in input$areafilter){
      df3<- rbind(df3, data2[data2$Area == val,])
    }
    
    data <- df3
    
    
    pal <- colorNumeric(c("green3", "yellow", "red"), 200000:1000000)
    
    m <- leaflet(data = data) %>%
      addProviderTiles(providers$CartoDB.Voyager) %>% 
      
      setView(lng=101.6869, lat=3.1390, zoom = 12) %>%
      addMarkers(lng=101.7122, lat=3.1577, icon = klcc, label = "KLCC") %>%
      addMarkers(lng=101.6538, lat=3.1209, icon = university_malaya, label = "University of Malaya") %>%
      addCircleMarkers(~lng, ~lat, label = ~location, radius = 5, color = "black", stroke = TRUE, fillColor = ~pal(Price_RM), weight = 0.5, fillOpacity = 0.7)
    
  })
}
