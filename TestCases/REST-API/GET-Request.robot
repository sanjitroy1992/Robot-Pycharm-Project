*** Settings ***
Documentation    Suite description
Library    RequestsLibrary
Library    Collections
*** Variables ***
${BaseURL}    https://restapi.demoqa.com
${City}    Bangalore
*** Test Cases ***
Weather Details
    Create Session    mysession    ${BaseURL}
    ${Response}    get request   mysession   /utilities/weather/city/${City}
    log   ${Response}
    ${status_code}    Convert To String    ${Response.status_code}
    Should Be Equal    ${status_code}    200
    Log To Console    ${Response.content}
    ${Content-Type}    Get From Dictionary    ${Response.headers}    Content-Type
    Should Be Equal    ${Content-Type}    application/json
