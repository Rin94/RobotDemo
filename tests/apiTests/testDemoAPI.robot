*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    String

*** Variables ***
#${base_url}    http://216.10.245.166
${base_url}    https://rahulshettyacademy.com
${book_id}
${book_name}    Learn Appium with Java


*** Test Cases ***
Play around with Dictionary
    [Tags]    API
    &{dictionary}=    Create Dictionary    name=rahulshetty    course=robot    website=rahulshettyacademy.com
    log    ${dictionary}
    Dictionary Should Contain Key    ${dictionary}    name
    Dictionary Should Contain Item    ${dictionary}    course    robot
    Dictionary Should Not Contain Value    ${dictionary}    jared.salinas
    log    ${dictionary}[name]
    ${value}=    Get From Dictionary    ${dictionary}     name
    log    ${value}
    
Add Book into Library Database
    [Tags]    API
    ${PO_Number}    Generate random string    5    0123456789
    ${isbn_string}    Generate random string    4
    &{req_body}    Create Dictionary    name=${book_name}   isbn=${isbn_string}    aisle=${PO_Number}   author=Angele Laeken
    ${response}=    POST    ${base_url}/Library/Addbook.php    json=${req_body}    expected_status=200
    Log    ${response.json()}
    Dictionary Should Contain Key    ${response.json()}    ID
    Dictionary Should Contain Value    ${response.json()}    successfully added
    ${book_id}=    Get From Dictionary    ${response.json()}    ID
    Set Global Variable    ${book_id}
    Log    ${book_id}
    Should Be Equal As Strings    ${response.json()}[Msg]    successfully added
    Status Should Be    200    ${response}

    
Get Book from Library Database
    [Tags]    API
    Get book response in database

Delete a book from Library Database
    [Tags]    API
    &{request_body}    Create Dictionary    ID=${book_id}
    ${response}=    POST    ${base_url}/Library/DeleteBook.php    json=${request_body}    expected_status=200
    Log     ${response.json()}
    Should Be Equal As Strings    ${response.json()}[msg]    book is successfully deleted
    
    
    
*** Keywords ***
Get book response in database
    ${response}=    GET    ${base_url}/Library/GetBook.php    params=ID=${book_id}
    log    ${response.json()}
    Should Be Equal As Strings    ${response.json()}[0][author]   Angele Laeken
    Should Be Equal As Strings    ${response.json()}[0][book_name]   ${book_name}
    
    

    

    
    
