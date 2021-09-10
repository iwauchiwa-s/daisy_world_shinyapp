library(shiny)
library(shinyWidgets)

# Define UI
shinyUI(pageWithSidebar(
  
  #  Application title
  headerPanel("Daisy World Simulator"),
  
  # Sidebar with sliders
  sidebarPanel(
    
    tags$h3("Parameter Settings"),
            
    selectInput("ssys", "Solar flux Scenarios", 
        choices = list("Constant" = 1, "Linear increase" = 2,
        "Periodic" = 3), selected = 1),
        
  	conditionalPanel(condition = "input.ssys == 1",
  		setSliderColor(c("DeepPink "), c(1)),
    	sliderInput("Scfc", "Factor for solar constant:", 
                min=0.5, max=2, value=1, step=0.1)
  	),

  	conditionalPanel(condition = "input.ssys == 2",
  		setSliderColor(c("DeepPink ", "DeepPink ", "DeepPink "), c(1, 2, 3)),
    	sliderInput("Scf1", "Initial factor for solar constant:", 
                min=0.5, max=2, value=0.6, step=0.1),
    	sliderInput("Scstp", "Change rate (per kilo-year):", 
                min=-0.015, max=0.1, value=0.005, step=0.005)
  	),

  	conditionalPanel(condition = "input.ssys == 3",
  		setSliderColor(c("DeepPink ", "DeepPink ", "DeepPink ", "DeepPink ", "DeepPink "), c(1, 2, 3, 4, 5)),
    	sliderInput("Scf_amp", "Amplitude of periodic change in solar factor:", 
                min=0, max=0.4, value=0.3, step=0.05),
    	sliderInput("Scf_frq", "Period (kilo-year):", 
                min=10, max=100, value=45, step=1)
  	),

    sliderInput("Ra", "Albedo of ground surface:", 
                min=0, max=1, value=0.5, step=0.05),
    
    sliderInput("Rw", "Albedo of white daisy:", 
                min=0, max=1, value=0.75, step=0.05),
     
    sliderInput("Rb", "Albedo of black daisy:", 
                min=0, max=1, value=0.25, step=0.05),
    
    
    
        
    br(),

    tags$br(),
    h5("Created by:"),
    h5("xxxxxxxx"),
    h5("xxxxxxxx")
   ),
  
  # Show plots
  mainPanel(
    h3("For quick understanding of GAIA hypothesis"),
    plotOutput("graph0"),
    plotOutput("graph1"),
    plotOutput("graph2"),
    plotOutput("graph3"),
    img(src = "daisy_world_img.png")
  )
))
