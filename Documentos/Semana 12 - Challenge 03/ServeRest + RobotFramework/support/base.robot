*** Settings ***
Documentation           Requisições HTTP para a API Restful-Booker
Library                 RequestsLibrary
Library                 Collections
Library                 OperatingSystem
Resource                ../keywords/login_keywords.robot
Resource               ../keywords/cadastro_usuario_keywords.robot
Resource                ../keywords/cadastrar_produto_keywords.robot
Resource               ../keywords/editar_produto_keywords.robot
Resource               ../keywords/buscar_produto_keywords.robot
Resource                ./fixtures/dynamics.robot
Resource                ./variables/serveRest_variables.robot
Resource                ./fixtures/dynamics.robot
Resource                ./common/common.robot    


* Keywords * 
Criar Sessao
    Create Session    alias=ServeRest    url=${BASE_URL}




