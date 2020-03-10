*** Settings ***
Documentation    Suite description
Library    RequestsLibrary
Library    Collections
*** Variables ***
${BaseURL}    https://postman-echo.com    #http://restapi.demoqa.com/customer
*** Test Cases ***
Customer Creation
    Create Session    mysession    ${BaseURL}
    ${Body}    create dictionary    FirstName=Raj123456    LastName=Raj123456    UserName=Raj123456    Password=Raj123456
    ${headers}    create dictionary    Content-Type=application/json
    ${Response}    post request   mysession   /post    data=${Body}    headers=${headers}
    ${status_code}    Convert To String    ${Response.status_code}
    Should Be Equal    ${status_code}    200
    log   ${Response}
    Log To Console    ${Response.content}
    ${Content-Type}    Get From Dictionary    ${Response.headers}    Content-Type
    Should Be Equal    ${Content-Type}    application/json; charset=utf-8
