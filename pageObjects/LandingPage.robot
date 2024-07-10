*** Settings ***
Documentation    A resource file with reusable keywords and variables
Library    SeleniumLibrary
Library    Collections
Library    String
Resource    ../pageObjects/Generic.resource

*** Variables ***
${error_message_login_locator}    css:.alert-danger
${error_message_login}    Incorrect username/password.
${username_locator}    id:username
${password_locator}    id:password
${btnSignIn_locator}   id:signInBtn
${linkMateriaWindowLocator}    xpath://a[@class='blinkingText']

*** Keywords ***

wait until it checks and display error message
    Wait Until Element Passed Is Located On Page    ${error_message_login_locator}

Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    ${username_locator}   ${username}
    Input Text    ${password_locator}   ${password}
    Click Button    ${btnSignIn_locator}

Verify error message is correct
    [Arguments]    ${error message}
    Element Text Should Be    ${error_message_login_locator}    ${error message}    ignore_case=True
    
select the link of child window
    Click Element    ${linkMateriaWindowLocator}
  
Verify the user is Switched to Child window
    Switch Window    NEW    30s
    Sleep    10
    Element Text Should Be    xpath://h1    DOCUMENTS REQUEST

Grab the email id in the child window
    ${expectedText}    Get Text    css:.red
    @{textList}    Split String    ${expectedText}    at
    ${text_split}=    Get From List    ${textList}    1
    @{textList2}=    Split String    ${text_split}
    ${email}=    Get From List    ${textList2}    0
    Set Global Variable    ${email}

Switch to parent window and enter the email
    Switch Window    MAIN   5s
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    ${username_locator}    ${email}
    Sleep    5s