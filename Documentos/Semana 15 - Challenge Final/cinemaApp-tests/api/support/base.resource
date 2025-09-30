*** Settings ***
Documentation    Importações e Funções uteis globalmente
Library        RequestsLibrary
Resource    ./variables/cinemaVariables.resource
Resource    ../keywords/cadastrar_usuario.resource
Resource    ../keywords/fazerLoginKeywords.resource
Resource    ../support/common/common.resource




*** Keywords ***
Criar Sessao
    Create Session    CinemaApp    url=${BASE_URL}