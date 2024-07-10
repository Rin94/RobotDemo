*** Settings ***
Documentation    To validate the Login form
Resource    ../pageObjects/Generic.resource
Resource    ../pageObjects/LandingPage.robot
Resource    ../pageObjects/ShoppingPage.robot
Resource   ../pageObjects/CheckoutPage.robot
Library    ../customLibraries/shop.py
Library    SeleniumLibrary
Test Setup    Open The Browser With The Browser Url
Test Teardown    Close Browser Session


*** Variables ***
@{productList}=     iphone X    Samsung Note 8    Nokia Edge    Blackberry
@{productAdded}=    Blackberry    Nokia Edge

*** Test Cases ***
Validate unsuccessfull login
    [Tags]    REGRESSION
    LandingPage.Fill The Login Form    ${invalid_user_name}    ${invalid_password}
    LandingPage.wait until it checks and display error message
    Verify error message is correct    ${error_message_login}
    

Validate order is created
    [Tags]    REGRESSION    SMOKE
    LandingPage.Fill The Login Form    ${user_name}    ${password}
    ShoppingPage.Verify Card Titles In The Shop Page    @{productList}
    Add Items To Card And Checkout    ${productAdded}
    ShoppingPage.click on checkout button
    CheckoutPage.verify the expected items are displayed in the checkout page    @{productAdded}
    CheckoutPage.verify order can be purchased    Belgium

Validate navigate to child window
    [Tags]    SMOKE    REGRESSION
    LandingPage.select the link of child window
    LandingPage.Verify the user is Switched to Child window
    LandingPage.Grab the email id in the child window
    LandingPage.Switch to parent window and enter the email





















