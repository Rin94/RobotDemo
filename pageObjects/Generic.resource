*** Settings ***
Documentation    A resource file with reusable keywords and variables

Library    SeleniumLibrary

*** Variables ***
#variables globales
${user_name}    rahulshettyacademy
${password}    learning
${invalid_user_name}    jared.salinas94
${invalid_password}    admin12345
${browser_name}    Chrome
${url}    https://rahulshettyacademy.com/loginpagePractise/

${radioBtn_User}    //input[@value='user']
${modalOk}    css:.modal-body
${okBtn}    xpath://button[@id='okayBtn']
${dropdown_role}    xpath://select
${checkBtnTerms}    xpath://input[@id='terms']


*** Keywords ***
##metodos generales
open the browser with the Mortgage payment url
    Open Browser    ${url}   headlesschrome
    Maximize Browser Window
    Set Browser Implicit Wait    30

open the browser with the Browser url
    Open Browser    ${url}   ${browser_name}
    Maximize Browser Window
    Set Browser Implicit Wait    30

Close Browser session
    Close Browser

Wait until Element passed is Located on page
    [Arguments]    ${page_locator}
    Wait Until Element Is Visible    ${page_locator}


Find element by xpath
    [Arguments]    ${before_xpath}    ${option}    ${after_xpath}
    
    RETURN    ${before_xpath}${option}${after_xpath}

       