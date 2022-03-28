#' @importFrom dplyr %>%
compare_situation <- function(x) {
  status_rfept <- status_rfept(x$rfept_complete)

  x$sistec_rfept_linked <- x$sistec_rfept_linked %>%
    dplyr::mutate(R_NO_STATUS_MATRICULA_SISTEC = dplyr::case_when(
      stringr::str_detect(!!sym("R_NO_STATUS_MATRICULA"), status_rfept$concluido) ~ "CONCLU\u00cdDA",
      stringr::str_detect(!!sym("R_NO_STATUS_MATRICULA"), status_rfept$integralizada) ~ "INTEGRALIZADA",
      stringr::str_detect(!!sym("R_NO_STATUS_MATRICULA"), status_rfept$abandono) ~ "ABANDONO",
      stringr::str_detect(!!sym("R_NO_STATUS_MATRICULA"), status_rfept$desligado) ~ "DESLIGADO",
      stringr::str_detect(!!sym("R_NO_STATUS_MATRICULA"), status_rfept$em_curso) ~ "EM_CURSO",
      stringr::str_detect(!!sym("R_NO_STATUS_MATRICULA"), status_rfept$transferido) ~ "TRANSF_EXT",
      stringr::str_detect(!!sym("R_NO_STATUS_MATRICULA"), status_rfept$reprovada) ~ "REPROVADA",
      TRUE ~ "N\u00c3O ENCONTRADO"
    )) %>%
    dplyr::mutate(S_NO_STATUS_IGUAL = dplyr::if_else(
      !!sym("R_NO_STATUS_MATRICULA_SISTEC") == !!sym("S_NO_STATUS_MATRICULA"),
      TRUE, FALSE
    ))

  class(x$sistec_rfept_linked) <- c("comparison_data_frame", class(x$rfept_complete)[-1])

  x
}

status_rfept <- function(x) {
  UseMethod("status_rfept")
}

status_rfept.qacademico_table <- function(x) {
  list(
    concluido = "Conclu\u00eddo|Formado", # Concluído
    integralizada = "Concludente|ENADE|V\u00ednculo", # Vínculo
    abandono = "Abandono",
    desligado = "Cancelamento|Jubilado",
    em_curso = "Matriculado|Trancado",
    transferido = "Transferido Externo",
    reprovada = "Reprovado"
  )
}

status_rfept.sigaa_table <- function(x) {
  list(
    concluido = "FORMADO|CONCLU\u00cdDO|CONCLU\u00cdDA",
    integralizada = "CANCELADO",
    abandono = "CANCELADO",
    desligado = "CANCELADO",
    em_curso = "CURSANDO|CONCLUINTE|TRANCADO|GRADUANDO|ATIVO|DEFENDIDO|FORMANDO",
    transferido = "CANCELADO",
    reprovada = "CANCELADO"
  )
}

status_rfept.generic_rfept_table <- function(x) {
  list(
    concluido = "CONCLU\u00cdDA",
    integralizada = "INTEGRALIZADA",
    abandono = "ABANDONO",
    desligado = "DESLIGADO",
    em_curso = "EM_CURSO",
    transferido = "TRANSF_EXT",
    reprovada = "REPROVADA"
  )
}

status_rfept.conecta_table <- function(x) {
  list(
    concluido = "Conclu\u00eddo|Formado",
    integralizada = "Integralizou",
    abandono = "Evas\u00e3o",
    desligado = "Desligado|desligamento|Interna|Matriz",
    em_curso = "Matriculado|Trancado|PMA",
    transferido = "Externa",
    reprovada = "Reprovada"
  )
}

status_rfept.suap_table <- function(x) {
  list(
    concluido = "Conclu\u00eddo",
    integralizada = "Institucional",
    abandono = "Evas\u00e3o",
    desligado = "Cancelamento",
    em_curso = "Matriculado|N\u00e3o conclu\u00eddo|Trancado",
    transferido = "Transferido Externo",
    reprovada = "Reprovada"
  )
}
