#
# This is designed by Minxuan Chen.
# Data: Crime_Incidents_in_2016.csv
# Data Source: DC Open Data.
#

# load libraries.
library(shiny)
library(leaflet)
library(ggplot2)

# load data
crime <- read.csv("Crime_Incidents_in_2016.csv", header=TRUE, stringsAsFactors=TRUE)
crime2<-na.omit(crime)
crime$DISTRICT<-as.factor(crime$DISTRICT)


shinyServer(function(input, output) {
  
  # get selected data summary
  output$Summary <- renderPrint({
    mysummary<-subset(crime, METHOD %in% input$inputweapon &
             SHIFT %in% input$inputtime & 
             OFFENSE %in% input$inputtype &
             DISTRICT %in% input$inputdist,
             select = c(SHIFT,METHOD,OFFENSE,DISTRICT))
    summary(mysummary)
  })
  
  # get districts safety plot
  output$Plot1 <- renderPlot({
    plotdata<-subset(crime,METHOD %in% input$inputweapon &
                       SHIFT %in% input$inputtime & 
                       OFFENSE %in% input$inputtype &
                       DISTRICT %in% input$inputdist)
    myplot<-ggplot(data=plotdata,aes(x=DISTRICT))
    myplot<-myplot+geom_bar(aes(fill = METHOD))
    myplot<-myplot+labs(title ="Selected Districts Safety", x = "District", y = "Crime Number")
    myplot<-myplot+theme(text = element_text(size=15))
    print (myplot)
    })
  
  # get districts time safety plot
  output$Plot2 <- renderPlot({
    plotdata<-subset(crime,METHOD %in% input$inputweapon &
                       SHIFT %in% input$inputtime & 
                       OFFENSE %in% input$inputtype &
                       DISTRICT %in% input$inputdist)
    myplot<-ggplot(data=plotdata,aes(x=SHIFT))
    myplot<-myplot+geom_bar(aes(fill = METHOD),position = "dodge")
    myplot<-myplot+labs(title ="Selected Districts Time Safety", x = "Time", y = "Crime Number")
    myplot<-myplot+theme(text = element_text(size=15))
    print (myplot)
  })
  
  # get districts crime type plot
  output$Plot3 <- renderPlot({
    plotdata<-subset(crime,METHOD %in% input$inputweapon &
                       SHIFT %in% input$inputtime & 
                       OFFENSE %in% input$inputtype &
                       DISTRICT %in% input$inputdist)
    myplot<-ggplot(data=plotdata,aes(x=DISTRICT))
    myplot<-myplot+geom_bar(aes(fill = OFFENSE),position = "dodge")
    myplot<-myplot+labs(title ="Selected Districts Crime Type", x = "Crime Type", y = "Crime Number")
    myplot<-myplot+theme(text = element_text(size=15))
    print (myplot)
  })
  
  # create colors with a categorical color function
  color <- colorFactor(rainbow(2, s = 1, v = 1, start = 0, end = 2/6, alpha = 1), crime$METHOD)
  
  # get crime detail map
  output$map <- renderLeaflet({
    
    # modify input data
    map <- leaflet(subset(crime, METHOD %in% input$inputweapon &
                            SHIFT %in% input$inputtime & 
                            OFFENSE %in% input$inputtype &
                            DISTRICT %in% input$inputdist)) %>%
      
      # locate map view in DC
      setView(lng = -77.0369, lat = 38.9, zoom = 11) %>%
      addProviderTiles("CartoDB.Positron", options = providerTileOptions(noWrap = TRUE)) %>%
      
      # plot each crime with circles
      addCircleMarkers(
        
        # mapping data by longitude and latitude
        lng=~LONGITUDE, 
        lat=~LATITUDE,
        
        # circle settings
        radius = 3, 
        stroke=FALSE,
        fillOpacity=0.5,
        
        # color circle by crime type
        color=~color(METHOD), 
        
        # detailed information of each reported crime
        popup=~paste(
          "<b>", as.character(OFFENSE), "</b><br/>",
          "Time: ", as.character(SHIFT),"<br/>",
          "Date: ", as.character(REPORT_DAT),"<br/>",
          "Weapon: ", as.character(METHOD),"<br/>",
          "District: ", as.character(DISTRICT)
        ))%>%
      
    # color legend of crime circles
    addLegend(
      "bottomleft",
      pal=color,
      values=~METHOD,
      opacity = 1,
      title="Weapon Type"
    )
  })
})