library(DT)
library(plotly)
function(input, output, session){
  
  #structure
  output$structure <- renderPrint(
    data %>%
      str()
  )
  
  #summary
  output$summary <- renderPrint(
    data %>%
      summary()
  )
  
  #datatable
  output$dataT <- renderDataTable({
    datatable(
      data,
      options = list(
        scrollX = TRUE
      )
    )
  })
  
  output$histplot <- renderPlotly({p1 <- data %>%
    plot_ly() %>%
    add_histogram(~get(input$Var1)) %>%
    layout(xaxis = list(title = input$Var1))
  
  p2 <- data %>%
    plot_ly() %>%
    add_boxplot(~get(input$Var1)) %>%
    layout(yaxis = list(showticklabels = F))
  
  subplot(p2, p1, nrows = 2) %>%
    hide_legend() %>%
    layout(title = "Distribution Chart - Histogram Chart", yaxis = list(title = "Frequency"))})
  }