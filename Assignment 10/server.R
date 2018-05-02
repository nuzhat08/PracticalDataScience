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
  
}