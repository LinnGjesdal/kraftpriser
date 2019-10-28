# Tests

# We need to test the function that loads the data from the api

context("test the data load from the api")

test_that("the data frame shows as a list", {
  df <- my_content_from_json
  expect_type(df, list)
})

test_that("data has been loaded from the api", {
  f <- tempfile()
  expect_true(file.exists(f))
})

test_that("test that the data from the api has been loaded as a data frame", {
  expect_is(my_content_from_json, "data.frame")
})
