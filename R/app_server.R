#' @import shiny
app_server <- function(input, output,session) {
  # List the first level callModules here
  callModule(mod_map_mod_server, "map_mod_ui_1")
}
