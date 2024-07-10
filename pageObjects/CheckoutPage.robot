*** Settings ***
Documentation    Shopping page objects
Library    SeleniumLibrary
Library    Collections


*** Variables ***
${btnCheckoutLocator}    xpath://button[contains(@class,'btn-success')]
${txtCountryLocator}    id:country
${btnPurchaseLocator}    xpath://input[@value='Purchase']
${checkBoxAgreeLocator}    xpath://label[@for='checkbox2']
${divSuccessPurchaseLocator}    //div[contains(@class,'alert-success')]
${divSuccessPurchaseText}    Success!
${landingCheckoutPageLocator}    //label[@for='country']


*** Keywords ***
verify the expected items are displayed in the checkout page
    [Arguments]    @{productList}
    
    FOR    ${product}    IN    @{productList}
        Page Should Contain    ${product}

    END

verify order can be purchased
    [Arguments]    ${countryName}
    Click On Continue To Checkout
    Wait Until Page Is Loaded
    select country in form    ${countryName}
    Click On Agree With Terms And Conditions
    Click On Purchase
    Verify The Order Is Successes

wait until page is loaded
    Wait Until Element Is Visible    ${landingCheckoutPageLocator}    30s

click on continue to checkout
    Click Button    ${btnCheckoutLocator}

click on purchase
    Click Element    ${btnPurchaseLocator}

select country in form
    [Arguments]    ${countryValue}
    Input Text    ${txtCountryLocator}    ${countryValue}
    Sleep    1s
    Wait Until Element Is Visible    //a[contains(text(),'${countryValue}')]    30s   
    Click Element    //a[contains(text(),'${countryValue}')]

click on agree with terms and conditions
    Wait Until Element Is Visible    ${checkBoxAgreeLocator}    60s
    Click Element    ${checkBoxAgreeLocator} 

    
verify the order is successes
    
    Page Should Contain    ${divSuccessPurchaseText}    
       
