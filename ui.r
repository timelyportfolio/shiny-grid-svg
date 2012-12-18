reactiveSvg <- function (outputId) 
{
  HTML(paste("<div id=\"", outputId, "\" class=\"shiny-network-output\"><svg /></div>", sep=""))
}

shinyUI(
  pageWithSidebar(
    headerPanel("Shiny with gridSVG"),
    sidebarPanel(
      selectInput("example", "Choose an example:", 
                  choices = c("xyplot", "dotplot", "barchart")),
      submitButton("Make Grid SVG")
      ),
    mainPanel(
      includeHTML("svgfiller.js"),
      reactiveSvg(outputId = "svg.grid")
      )
    )
  )