#
# This is designed by Minxuan Chen.
# Data: Crime_Incidents_in_2016.csv
# Data Source: DC Open Data.
#

# load libraries.
library(shiny)
library(leaflet)
library(ggplot2)

shinyUI(
  
  # use a fluid Bootstrap layout
  fluidPage(
    
    # give the page a title
    titlePanel("DC Crime Report"),
    
    # set sidebar to select a certain range of data
    sidebarPanel( 
        
        # comments to help choose the variables
        helpText("Choose Concerned Catagories"),  
      
        # select weapon type
        selectInput("inputweapon", "Weapon Type:",multiple = TRUE,
                    choices=c("GUN","KNIFE","OTHERS")),
        
        # select crime time
        selectInput("inputtime", "Crime Time:",multiple = TRUE,
                    choices=c("DAY","EVENING","MIDNIGHT")),
        
        # select crime type
        selectInput("inputtype", "Crime Type:",multiple = TRUE,
                    choices=c("THEFT/OTHER","THEFT F/AUTO","ROBBERY","MOTOR VEHICLE THEFT",
                              "BURGLARY","ASSAULT W/DANGEROUS WEAPON","SEX ABUSE"
                              ,"HOMICIDE","ARSON")),
        
        # select districts in DC
        selectInput("inputdist", "District:",multiple = TRUE,
                    choices=c("1","2","3","4","5","6","7")),
        
        # comments to help choose the variables
        helpText("Select Weapon Type 'OTHERS' May Slow Your Device !!!")
      ),
    
    # output of leaflet map
    mainPanel(leafletOutput("map")),
    
    # output of data summary and plots in tabset panels
    tabsetPanel(type = "tabs",
                tabPanel("Summary",verbatimTextOutput("Summary")),
                tabPanel("District Safety", plotOutput("Plot1")),
                tabPanel("Time Safety", plotOutput("Plot2")),
                tabPanel("Crime Type in Districts", plotOutput("Plot3"))
    )
  )
)