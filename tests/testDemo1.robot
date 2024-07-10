*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Resource    ../pageObjects/Generic.resource
#this will be executed in the end
Test Setup    Open The Browser With The Browser Url
Test Teardown    Close Browser
#Resource

*** Variables ***
#create variables
${error_message_login}=    css:.alert-danger


*** Test Cases ***
Validate Unsuccessful Login
    [Tags]    REGRESSION
    open the browser with the Mortgage payment url
    Fill the login form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
Fill the login form
    Input Text    id:username    jared.salinas
    Input Text    id:password    jared
    Click Button    id:signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${error_message_login}

verify error message is correct
    #${expectedText}=    Get Text    ${error_message_login}
    #Should Be Equal As Strings    ${expectedText}    Incorrect username/password.
    Element Text Should Be    ${error_message_login}    Incorrect username/password.    ignore_case=True



