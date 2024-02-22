library(shiny)

# Define UI ----
ui <- fluidPage(
  titlePanel("University of Massachusetts Amherst Zoo"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Welcome to the University of Massachusetts Amherst Zoo!
               Please visit some of our animal exhibits. We hope you have
               a wonderful time with us today."),
      
      selectInput("animal", label = "What animal do you want to see?",
                  choices = c("Dog",
                              "Cat",
                              "Bird",
                              "Horse"))
    ),
    
    mainPanel(
      uiOutput("selected_animal")
    )
  )
)

# Define server logic ----
server <- function(input, output) {
  output$selected_animal <- renderUI({
    selected_animal <- switch(input$animal,
                       "Dog" = "Dog.jpg",
                       "Cat" = "Cat.jpg",
                       "Bird" = "Bird.jpg")
    img_path <- file.path("www", selected_animal)
    tags$img(src = img_path, width = 400, height = 300)
  })
}
  

# Run the app ----
shinyApp(ui = ui, server = server)