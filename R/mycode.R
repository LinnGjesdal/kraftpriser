# Home Exercises Session 3 R course

# use Ctrl + Shift + L to avoid storing the package in the global environment

# The function within the package must be documented using roxygen: Ctrl + Shift + Alt + R

# When updating the documentation, use Ctrl + Shift + D

#' use_api
#'
#' @description use_api loads data from about Norwegian hydro power from Norges vassdrags- og energidirektorat (NVE) and saves it to a data frame.
#'
#' @return Loading data from api
#' @export
use_api <- function() {
  pacman::p_load(httr, jsonlite, dplyr)
  my_url <- paste0("https://www.nve.no/umbraco/api/Powerplant/GetHydroPowerPlantsInOperation")
  my_raw_result <- httr::GET(my_url)
  my_content <- httr::content(my_raw_result, as = 'text')
  my_content_from_json <- jsonlite::fromJSON(my_content)

}
#' @examples





#' powerproduction
#' @title powerproduction
#' @param .data
#' @param name_power_station
#' @examples data <- powerproduction() returns a data frame with 1672 oberservation of two variables, MidProd_81_10 and Navn
#'
#' @description powerproduction is a function that uses data from the use_api() function to load data from about Norwegian hydro power from Norges vassdrags- og energidirektorat (NVE), and then returns a data frame showing power stations and yearly power production for that power station.
#'
#' @return Returning yearly power production per power station
#' @export
powerproduction <- function(.data, name_power_station) {
  data <- use_api()
  data_adjusted <- select(data, MidProd_81_10, Navn)
}







#' powerproduction_for_one
#' @title power_production_for_one
#' @param .data
#' @param name_power_station
#' @examples grondal <- powerproduction_for_one(name_power_station = "Grøndal") returns a data frame with 1 oberservation of two variables, MidProd_81_10 and Navn. This is the yearly power production for the power station, Grøndal.
#'
#' @description powerproduction_for_one is a function that uses data from the use_api() function to load data from about Norwegian hydro power from Norges vassdrags- og energidirektorat (NVE), and then returns a data frame showing a selected power station and its yearly power production.
#'
#' @return Returning yearly power production per power station
#' @export
powerproduction_for_one <- function(.data, name_power_station) {
  data <- use_api()
  data <- select(data, MidProd_81_10, Navn)
  data <- data[data$Navn==name_power_station,]
}
