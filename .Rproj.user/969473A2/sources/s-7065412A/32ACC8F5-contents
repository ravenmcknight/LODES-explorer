# Module UI
  
#' @title   mod_map_mod_ui and mod_map_mod_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_map_mod
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_map_mod_ui <- function(id){
  ns <- NS(id)
  tagList(
  
  )
  
  sidebarLayout(
    sidebarPanel(
      h3("Make Selections"),
      selectInput(inputId = ns("wardSelect"), 
                  label = "Select Ward(s)", 
                  choices = c("Ward 1" = "one",
                              "Ward 2" = "two",
                              "Ward 3" = "three",
                              "Ward 4" = "four",
                              "Ward 5" = "five",
                              "Ward 6" = "six",
                              "Ward 7" = "seven"), 
                  multiple = TRUE,
                  selectize = TRUE),
      radioButtons(inputId = ns("viewSelect"),
                   label = "View employees who:",
                   choices = c("Work here" = "work",
                               "Live here" = "home"))
    ),
    mainPanel(
      leaflet::leafletOutput(ns("main_map"))
    )
  )

    

}
    
# Module Server
    
#' @rdname mod_map_mod
#' @export
#' @keywords internal
    
mod_map_mod_server <- function(input, output, session){
  ns <- session$ns

  output$main_map <- leaflet::renderLeaflet({
  
    leaflet::leaflet() %>% leaflet::addTiles()
    
  })
}
    
## To be copied in the UI
# mod_map_mod_ui("map_mod_ui_1")
    
## To be copied in the server
# callModule(mod_map_mod_server, "map_mod_ui_1")
 
