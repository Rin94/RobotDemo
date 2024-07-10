*** Settings ***
Documentation    Shopping page objects
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${Shop_page_load_locator}    css:.nav-link
${listPage_locator}    xpath://h4[@class='card-title']//a 
${checkOutBtnLocator}    //a[contains(text(),'Checkout')]

*** Keywords ***


Verify Card titles in the Shop page
    [Arguments]    @{expectedList}
    @{listPage}=    Get Webelements    ${listPage_locator}
    @{actualList}=    Create List
    FOR    ${elementList}    IN    @{listPage}
        Log    ${elementList.text}
        ${txt}=    Get Text    ${elementList}
        Append To List    ${actualList}    ${txt}
    END
    Lists Should Be Equal    ${expectedList}    ${actualList}
    
    
click on checkout button
    Click Element    ${checkOutBtnLocator}
    Sleep    5s

    