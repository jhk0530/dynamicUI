library(shiny)
library(shinyjs)

ui = function(){
  fluidPage(
    shinyjs::useShinyjs(),
    numericInput('num', 'num label', value = 1, min = 1, max = 5),
    uiOutput('temp'),
    actionButton('btn', 'btn label')
  )
}

server = function(input, output, session){
  output$temp = renderUI({    
    if(input$btn==0){return(NULL)} 
    input$btn    
    shinyjs::hide('num')
    shinyjs::hide('btn')
    cnt = as.integer(input$num)
    
    lapply(1:cnt, function(i){
      sliderInput(inputId = paste0('sld',i), label = paste0('sldLab',i), min = i, max = i+5, value = i+1)
    })
  
  })
}
shinyApp(ui,server)
