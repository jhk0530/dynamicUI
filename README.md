# dynamicUI in shiny.

- `reactivity`고 `isolate`고 다 필요없고 그냥 `shinyjs::hide` 한방이면 끝.
- `uiOutput`
- `renderUI`
- `tagList` or `lapply`

[see also] (https://stackoverflow.com/questions/19130455/create-dynamic-number-of-input-elements-with-r-shiny)

```R
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
```

![I2](https://user-images.githubusercontent.com/6457691/74713615-4709ed80-526c-11ea-8a20-b016523012f9.gif)
