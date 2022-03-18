test_that("read_sistec_students works", {
  skip_on_cran()
  
  print(system.file(
    "extdata/test_pnp_critics/students", package = "ARIA"
  ))
  
  students <- read_sistec_students(
    system.file(
      "extdata/test_pnp_critics/students", package = "ARIA"
    ))
  
  check_sistec_students_table(students, expect_nrow = 3062)

  students <- read_sistec_students(
    system.file(
      "extdata/test_pnp_critics/students", package = "ARIA"
    ), start = "2020.1")
  
  check_sistec_students_table(students, expect_nrow = 460)
})
