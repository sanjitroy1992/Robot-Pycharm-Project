*** Settings ***
Documentation    Suite description
Library      SeleniumLibrary
*** Variables ***
${Message}  How are you?
${BROWSER}  chrome

*** Test Cases ***
Verify Robot Framework Installation
  Log  Hello World!
  Log To Console    Hello, ${Message}

Verify Selenium And Web Driver
  ${Status}    Run Keyword And Return Status    open browser  http://finastra.com  ${BROWSER}
  Run Keyword If    '${Status}' =='False'    Fail    "Chrome browser is not installed ....Please install"
  Maximize Browser Window
  Close Browser
