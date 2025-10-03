*** Settings ***
Documentation    Importações e Funções uteis globalmente
Library        RequestsLibrary
Library        Collections
Library        JSONLibrary
Library     ../support/libs/database.py
Resource    ./variables/cinemaVariables.resource
Resource    ../support/common/common.resource
Resource    ../keywords/CreateUserKeywords.resource
Resource    ../keywords/LoginKeywords.resource
Resource    ../keywords/UpdateMovieKeywords.resource
Resource    ../keywords/CreateMovieKeywords.resource
Resource    ../keywords/DeleteMovieKeywords.resource
Resource    ../keywords/CreateSessionKeywords.resource
Resource    ../keywords/CreateTheaterKeywords.resource
Resource    ../keywords/CreateReservationsKeywords.resource
Resource    ../keywords/UpdateSessionKeywords.resource
Resource    ../keywords/UpdateReservationsKeywords.resource
Resource    ../keywords/UpdateMovieKeywords.resource
Resource    ../keywords/DeleteUserKeywords.resource
Resource    ../keywords/DeleteReservationsKeywords.resource

*** Keywords ***
Make New Session
    Create Session    CinemaApp    url=${BASE_URL}