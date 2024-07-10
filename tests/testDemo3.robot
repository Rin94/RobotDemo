*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections
Library    String
Test Setup    Open The Browser With The Mortgage Payment Url
Test Teardown    Close Browser Session
Resource    ../pageObjects/Generic.resource

*** Variables ***
${error_message_login}    css:.alert-danger
${shop_page_load}    css:.nav-link
${expected_error_message}    Incorrect username/password.


*** Test Cases ***
#llamadas a metodos
Validate Child window Functionality
    [Tags]    SMOKE    REGRESSION
    Select the link of child window
    Verify the user is Switched to Child window
    Grab the email id in the child window
    Switch to parent window and enter the email
    
*** Keywords ***
##son como metodos
Select the link of child window
    ${linkMateria}=    Find Element By Xpath    xpath://a[@class='    blinkingText    ']
    Click Element    ${linkMateria}
  
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
    Input Text    id:username    ${email}
    Sleep    5s




    
    
    


    

    

    







