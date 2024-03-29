#' @import shiny
app_ui <- function() {
  
  # Include a fliudPage above the navbar to incorporate a icon in the header
  # Source: http://stackoverflow.com/a/24764483
  fluidPage(
    tagList(
      # Leave this function for adding external resources
      golem_add_external_resources(),
      
      list(tags$head(HTML('<link rel="icon", href="logo.png",
                          type="image/png" />')))),
    div(style="padding: 1px 0px; width: '100%'",
        titlePanel(
          title="", windowTitle="Home"
        )
    ),
    
    navbarPage(title=div("LODES Explorer"),
               inverse = F, # for diff color view
               theme = shinythemes::shinytheme("sandstone"),
               
               tabPanel("Home", icon = icon("home"),
                        
                        shinyLP::jumbotron("LODES Explorer", "An app to explore LEHD Origin Destination Employment Data", button = FALSE),
                        
                        
                        #### FAVICON TAGS SECTION ####
                        tags$head(tags$link(rel="shortcut icon"))
                        
                        # shinyBS::bsModal("modalExample", "Instructional Video", "tabBut", size = "large" ,
                        #         p("Additional text and widgets can be added in these modal boxes. Video plays in chrome browser"),
                        #         shinyLP::iframe(width = "560", height = "315", url_link = "https://www.youtube.com/embed/0fKg7e37bQE")
                        # )
                        
                        ),
               
               tabPanel("Explore", icon = icon("map-marked-alt"),
                        mod_map_mod_ui("map_mod_ui_1")
                        
               )
    ) # end navbar page      
      ) # end of fluidPage
  
}

#' @import shiny
golem_add_external_resources <- function(){
  
  addResourcePath(
    'www', system.file('app/www', package = 'LODESexplorer')
  )
  
  tags$head(
    golem::activate_js(),
    golem::favicon()
    # Add here all the external resources
    # If you have a custom.css in the inst/app/www
    # Or for example, you can add shinyalert::useShinyalert() here
    #tags$link(rel="stylesheet", type="text/css", href="www/custom.css")
  )
}