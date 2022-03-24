sistec_update_student_status <- function(ciclo, period,
                                         headers_path,
                                         student_id, status) {
  
  sistec_url <- create_sistec_update_url(ciclo, period)
  sistec_headers <- create_sistec_update_headers(headers_path)
  sistec_body <- create_sistec_update_body(student_id, status)
  
  httr::POST(
    sistec_url,
    sistec_headers,
    body = sistec_body
  )
}

create_sistec_update_url <- function(ciclo, period) {
  paste0(
    "https://sistec.mec.gov.br/aluno/aplicaracaoemlote/ciclo/",
    ciclo,
    "/periodoAlteracao/",
    period
  )
}

create_sistec_update_headers <- function(headers_path) {
  headers <- utils::read.csv(headers_path)
  httr::add_headers(.headers = c(
    'Host' = headers$value[1],
    'User-Agent' =  headers$value[2],
    'Accept' = headers$value[3],
    'Accept-Language' = headers$value[4],
    'Accept-Encoding' = headers$value[5],
    'X-Requested-With' = headers$value[6],
    'X-Request' = headers$value[7],
    'Content-type' = headers$value[8],
    'Content-Length' = headers$value[9],
    'Origin' = headers$value[10],
    'Connection' = headers$value[11],
    'Referer' =  headers$value[12],
    'Cookie' = headers$value[13],
    'Sec-Fetch-Dest' = headers$value[14],
    'Sec-Fetch-Mode' = headers$value[15],
    'Sec-Fetch-Site' = headers$value[16]
  ))
}

create_sistec_update_body <- function(student_id, status){
  paste0(
    "alunos[0]=", student_id,
    "&acao=", status
  )
}
