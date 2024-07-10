*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections
Test Setup    Open The Browser With The Mortgage Payment Url
Test Teardown    Close Browser Session
Resource    ../pageObjects/Generic.resource

*** Variables ***
${error_message_login}    css:.alert-danger
${shop_page_load}    css:.nav-link
${expected_error_message}    Incorrect username/password.

*** Test Cases ***
#llamadas a metodos
Validate Unsuccessful Login
    [Tags]    REGRESSION
    Fill The Login Form    ${invalid_user_name}    ${invalid_password}
    Wait Until Element Is Locate In The Page    ${error_message_login}
    verify error message is correct
    
Validate Cards display in the shopping page
    [Tags]    REGRESSION
    Fill The Login Form    ${user_name}    ${password}
    Wait Until Element Is Locate In The Page    ${shop_page_load}
    Verify Card titles in the Shop page
    Select the Card    Blackberry
    
    
Select the Form and navigate to child window
    [Tags]    REGRESSION    SMOKE
    Fill The Login Form and select admin the user option

*** Keywords ***
##son como metodos
Fill the login form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Text    id:password    ${password}
    Click Button    id:signInBtn

wait until Element is locate in the page
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

verify error message is correct
    Element Text Should Be    ${error_message_login}    ${expected_error_message}   ignore_case=True

Verify Card titles in the Shop page
    @{expectedList}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    @{listPage}=    Get Webelements    xpath://h4[@class='card-title']//a
    @{actualList}=    Create List
    FOR    ${elementList}    IN    @{listPage}
        Log    ${elementList.text}
        ${actualText}=    Get Text    ${elementList}
        Append To List    ${actualList}    ${actualText}
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}
    
Select the Card
    [Arguments]    ${cardName}
    @{listPage}=    Get Webelements    xpath://h4[@class='card-title']//a
    ${index}=    Set Variable    1
    FOR    ${element}    IN    @{listPage}
        Exit For Loop If    '${element.text}'=='${cardName}'

        ${index}=    Evaluate    ${index}+1
              
    END
    
    Click Button   xpath:(//button[@class='btn btn-info'])[${index}]
    Sleep    5s
    
Fill The Login Form and select admin the user option
    ${role}    Set Variable    consult
    Input Text    id:username    ${user_name}
    Input Password    id:password    ${password}
    Click Element    ${radioBtn_User}
    Sleep    1s
    Wait Until Element Is Visible    ${modalOk}    10s
    Click Element    ${okBtn}
    Click Element    ${okBtn}
    Wait Until Element Is Not Visible    ${modalOk}   10s
    Select From List By Value    ${dropdown_role}    ${role}
    Select Checkbox    ${checkBtnTerms}
    Checkbox Should Be Selected    terms
    ${linkMateria}=    Find Element By Xpath    xpath://a[@class='    blinkingText    ']
    ${url}=    Get Element Attribute    ${linkMateria}    href
    Log    ${url}
    Click Element    ${linkMateria}
    Sleep    5s
    

    

    







