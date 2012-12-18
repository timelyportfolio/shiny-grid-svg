reactiveSvg <- function (outputId) 
{
  HTML(paste("<div id=\"", outputId, "\" class=\"shiny-network-output\"><svg /></div>", sep=""))
}

shinyUI(
  pageWithSidebar(
    headerPanel("Shiny with gridSVG"),
    sidebarPanel(
      HTML("Motivated by the very fine work of Paul Murrell in this 
            <a href=\"http://www.stat.auckland.ac.nz/~paul/Reports/ggplotSlider/ggplotSlider.html\">Technical Report</a>
            and <a href=\"http://journal.r-project.org/current.html\">articles recently published in the R-Journal</a> I will show how to send
            grid graphics as SVG to the browser with Shiny.<br></br>Does not work in IE.<br></br>"),
      selectInput("example", "Choose an example lattice chart (from lattice package documentation):", 
                  choices = c("xyplot", "dotplot", "barchart")),
      #submitButton("Make Grid SVG"),
      helpText(HTML("All source available on <a href = \"https://github.com/timelyportfolio/shiny-grid-svg\">Github</a>"))
      ),
    mainPanel(
      includeHTML("svgfiller.js"),
      reactiveSvg(outputId = "svg.grid")
      )
    )
  )