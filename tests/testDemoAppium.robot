# This sample code supports Appium Robot client >=2
# pip install robotframework-appiumlibrary
# Then you can paste this into a file and simply run with Robot
#
# Find keywords at: http://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html
#
# If your tests fails saying 'did not match any elements' consider using 'wait activity' or
# 'wait until page contains element' before a click command

*** Settings ***
Library           AppiumLibrary
Test Teardown     Close Application

*** Test Cases ***
Test Case Name
    Open Application    http://127.0.0.1:4723    appium:app=${CURDIR}/demoApp/General-Store.apk    appium:deviceName=JaredSalinasEmulator    platformName=android    appium:automationName=UIAutomator2    appium:ensureWebviewsHavePages=${True}    appium:nativeWebScreenshot=${True}    appium:newCommandTimeout=${3600}    appium:connectHardwareKeyboard=${True}
    Wait Until Element Is Visible    id=com.androidsample.generalstore:id/nameField    10s
    Enter Name    Jared Salinas
    Sleep    5s



*** Keywords ***
Enter Name
    [Arguments]    ${name}
    Input Text    id=com.androidsample.generalstore:id/nameField    ${name}
    
    
    