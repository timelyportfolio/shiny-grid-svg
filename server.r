require(lattice)
require(stats)
require(gridSVG)

shinyServer(function(input,output) {
  exampleInput <- reactive(function(){
    print(input$example)  #for debugging
    paste(input$example,"example",sep=".")
  })
  
  output$svg.grid <- reactive(function(){
    #from lattice package documentation
    Depth <- equal.count(quakes$depth, number=8, overlap=.1)
    xyplot.example <- xyplot(lat ~ long | Depth, data = quakes)
    
    dotplot.example <- dotplot(variety ~ yield | site, data = barley, groups = year,
                              key = simpleKey(levels(barley$year), space = "right"),
                              xlab = "Barley Yield (bushels/acre) ",
                              aspect=0.5, layout = c(1,6), ylab=NULL)
    
    barchart.example <- barchart(yield ~ variety | site, data = barley,
                                groups = year, layout = c(1,6), stack = TRUE,
                                auto.key = list(space = "right"),
                                ylab = "Barley Yield (bushels/acre)",
                                scales = list(x = list(rot = 45)))
    
    print(get(exampleInput()))
    #print((paste(input$example,"example",sep=".")))
    tempsvg <- tempfile(fileext=".svg")
    on.exit(unlink(tempsvg))
    gridToSVG(name=tempsvg)
    svgoutput <- readLines(tempsvg, n=-1)
    svgoutput
  })
})