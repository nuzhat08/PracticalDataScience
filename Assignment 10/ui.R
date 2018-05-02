ui <-fluidPage(
  titlePanel("Predicting Species"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("Sepal_length", label = "Sepal_length:", value = 5.1, min = 0, max =10, step =.1)
      ,sliderInput("Sepal_width", "Sepal_width", value = 3.2,
                    min = 0, max = 5, step = .5)
      ,sliderInput("Petal_length", "Petal_length", value = 1.2,
                    min = 0, max = 5, step = .1)
      ,sliderInput("Petal_width", "Petal_width", value = 1.2,
                    min = 0, max = 5, step = .1)
      
    ),
    mainPanel(
      DT::dataTableOutput("pred_table")
    )
  )
)