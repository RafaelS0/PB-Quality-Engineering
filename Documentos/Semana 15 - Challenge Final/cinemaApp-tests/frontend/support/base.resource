*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    JSONLibrary
Library    String
Library    ../support/libs/database.py
Resource    env.resource
Resource    ../support/pages/SignupPage.resource
Resource    ../support/pages/components/header.resource
Resource    ../support/common/common.resource

*** Keywords ***
Start Session
    Open Browser    ${BASE_URL}    chrome