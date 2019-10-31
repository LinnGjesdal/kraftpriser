# Tests

# We need to test the function that loads the data from the api to a data frame

context("test the data load from the api and onto the data frame")


test_that('the number of columns in the data frame is correct', {
  data <- powerproduction()
  expect_equal(ncol(data), 2)
})

test_that('data types are correct', {
  data <- powerproduction()
  expect_is(data,'data.frame')
  expect_is(data$Navn, 'character')
  expect_is(data$MidProd_81_10, 'numeric')
})

test_that('powerproduction_for_one works in the same way as powerproduction, but for a smaller data frame', {
  df <- powerproduction_for_one(name_power_station = "Grøndal")
  expect_equal(ncol(df), 2)
  expect_equal(nrow(df), 1)
  # the above tests that we have a smaller set, as we should only have data for one station
  expect_is(df, 'data.frame')
  expect_is(df$Navn, 'character')
  expect_is(df$MidProd_81_10, 'numeric')
})
