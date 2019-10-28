# First function goes here

# use Ctrl + Shift + L to avoid storing the package in the global environment

# The function within the package must be documented using roxygen: Ctrl + Shift + Alt + R

#' use_api
#'
#' @description use_api loads data from about Norwegian hydro power from Norges vassdrags- og energidirektorat (NVE) and saves it to a data frame.
#'
#' @return
#' @export
#'
#' @examples
#' Loading data from api
use_api <- function() {
  pacman::p_load(httr, jsonlite, dplyr)
  my_url <- paste0("https://www.nve.no/umbraco/api/Powerplant/GetHydroPowerPlantsInOperation")
  my_raw_result <- httr::GET(my_url)
  my_content <- httr::content(my_raw_result, as = 'text')
  my_content_from_json <- jsonlite::fromJSON(my_content)

}

