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

t <- read.csv(
  "inst/extdata/test_datasets/sistec_encoding/latin1/fake_data_sistec_latin1.csv"
)

t %>% 
  mutate(S_CO_ALUNO = 1:nrow(t)) %>% glimpse()
  transmute(
    NO_ALUNO = S_NO_ALUNO, 
    NU_CPF = S_NU_CPF, 
    CO_ALUNO = S_CO_ALUNO, 
    CO_CICLO_MATRICULA = S_NO_CAMPUS,
    NO_STATUS_MATRICULA = S_NO_STATUS_MATRICULA,
    NO_CICLO_MATRICULA = S_NO_CICLO_MATRICULA,
    DT_DATA_INICIO = S_DT_DATA_INICIO, 
    S_CO_UNIDADE_ENSINO) %>% 
  write.table(
    "inst/extdata/test_datasets/latin1_3.csv",
    row.names = FALSE, sep = ",", fileEncoding = "UTF-8"
  )
  
t <- read.csv(
  "inst/extdata/test_datasets/sistec/fake_data_sistec_2019.1_2020.1.csv",
  encoding = "UTF-8"
)
