server<-function(input, output){
  
  Preds<-reactive({
    generatePreds(
      Sepal_length = input$Sepal_length,
      Sepal_width = input$Sepal_width,
      Petal_length =  input$Petal_length,
      Petal_width =  input$Petal_width
      )
  })
  
  # formatPercentage= function(columns, digits) {
  #   round(columns,digits)
  # }
  
  output$pred_table <- DT::renderDataTable({
    Preds() 
      # datatable()%>%
      # formatPercentage(columns= 'preds', digits =2)
  }
  
  )
  
  output$ScatterPlot <- renderPlot({
    ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width))  + geom_point(aes(color=Species, shape=Species)) +
      xlab("Sepal Length") +  ylab("Sepal Width") +
      ggtitle("Sepal Length-Width")
  })
  
  output$DensityPlot1 <- renderPlot({
    ggplot(data=iris, aes(x=Sepal.Length, fill=Species))+geom_density(stat="density", alpha=I(0.2)) +
      xlab("Sepal Length") +  ylab("Density") + ggtitle("Density Curve of Sepal Length")
  })
  output$DensityPlot2 <- renderPlot({
    ggplot(data=iris, aes(x=Sepal.Width, fill=Species))+geom_density(stat="density", alpha=I(0.2)) +
      xlab("Sepal Width") +  ylab("Density") + ggtitle("Density Curve of Sepal Width")
  })
  output$DensityPlot3 <- renderPlot({
    ggplot(data=iris, aes(x=Petal.Length, fill=Species))+geom_density(stat="density", alpha=I(0.2)) +
      xlab("Petal Length") +  ylab("Density") + ggtitle("Density Curve of Petal Length")
  })
  output$DensityPlot4 <- renderPlot({
    ggplot(data=iris, aes(x=Petal.Width, fill=Species))+geom_density(stat="density", alpha=I(0.2)) +
      xlab("Petal Width") +  ylab("Density") + ggtitle("Density Curve of Petal Width")
  })
}