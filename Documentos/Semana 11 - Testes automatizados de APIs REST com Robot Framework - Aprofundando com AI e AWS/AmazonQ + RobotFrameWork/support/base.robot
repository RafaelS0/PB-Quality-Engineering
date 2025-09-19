*** Settings ***
Documentation           Requisições HTTP para a API Restful-Booker
Library                 RequestsLibrary
Library                 Collections
Library                 OperatingSystem
Resource                ../keywords/login_keywords.robot
Resource                ../keywords/nova_reserva_keywords.robot
Resource                ../keywords/editar_reserva_keywords.robot
Resource                ../keywords/atualizar_reserva_parcial_keywords.robot
Resource                ../keywords/buscar_uma_reserva_keywords.robot
Resource                ../keywords/deletar_reserva_keywords.robot
Resource                ./variables/booker_variables.robot
Resource                ./fixtures/dynamics.robot
Resource                ./common/common.robot    


* Keywords * 
Criar Sessao
    Create Session    alias=Booker    url=${BASE_URL}



