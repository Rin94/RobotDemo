*** Settings ***
Documentation    To validate the Login form
Resource    ../pageObjects/Generic.resource
Library    SeleniumLibrary
Test Setup    Open The Browser With The Mortgage Payment Url
Test Teardown    Close Browser Session
Test Template    Validate Unsuccessful login
#Resource

*** Variables ***
#create variables
${error_message_login}=    css:.alert-danger


*** Test Cases ***    username    password    error message
Invalid username    dsahed    learning    Incorrect username/password.
Invalid password    rahulshetty    learning    Incorrect username/password.
Special characters    @#$    learning    Incorrect username/password.
Blank spaces    ${EMPTY}    ${EMPTY}    Empty username/password.


*** Keywords ***
Validate Unsuccessful login
    [Arguments]    ${username}    ${password}    ${error message}
    Fill the login Form    ${username}    ${password}
    Wait Until It Checks And Display Error Message    
    Verify Error Message Is Correct    ${error message}

fill the login Form
    [Arguments]    ${username}    ${password}    
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${error_message_login}

verify error message is correct
    [Arguments]    ${error message}
    Element Text Should Be    ${error_message_login}    ${error message}    ignore_case=True



