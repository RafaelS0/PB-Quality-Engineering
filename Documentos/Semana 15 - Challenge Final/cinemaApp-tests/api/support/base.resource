*** Settings ***
Documentation    Importações e Funções uteis globalmente
Library        RequestsLibrary
Library        Collections
Library        JSONLibrary
Library     ../support/libs/database.py
Resource    ./variables/cinemaVariables.resource
Resource    ../keywords/cadastrar_usuario.resource
Resource    ../keywords/fazerLoginKeywords.resource
Resource    ../support/common/common.resource
Resource    ../keywords/upadteMovieskeywords.resource
Resource    ../keywords/createMovieKeywords.resource
Resource    ../keywords/deleteMovieKeywords.resource
Resource    ../keywords/createMovieKeywords.resource
Resource    ../keywords/createSessionkeywords.resource
Resource    ../keywords/createTheaterKeywords.resource
Resource    ../keywords/createReservations.resource
Resource    ../keywords/updateSessionkeywords.resource



*** Keywords ***
Criar Sessao
    Create Session    CinemaApp    url=${BASE_URL}