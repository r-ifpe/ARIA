headers_path <- "C://Users/dmmad/Desktop/Aria/teste_aria/headers.csv"
student_example <- read.csv(
    "C://Users/dmmad/Desktop/Aria/teste_aria/student_example.csv",
    colClasses = c(value = "character") 
  )

ARIA:::sistec_update_student_status(
  ciclo = student_example$value[1],
  period = student_example$value[2],
  headers_path = headers_path,
  student_id = student_example$value[3],
  status = student_example$value[4]
)