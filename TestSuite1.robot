*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            https://www.makemytrip.com/    # URL of the Website to be automated
@{creds}          standard_user    secret_sauce    # List containing creds

*** Test Cases ***
Test1
    [Tags]    Sanity
    checkLoginAndLogOutFlow

TestOnSauceDemo
    [Tags]    Regression
    checkLoginAndLogOutFlow

Test3
    [Tags]    Smoke
    OpenBrowserAndNavigateToURL
    Log To Console    HI

TestOnMMT
    [Tags]    MMT
    clickOnWebElement

Test5
    [Tags]    Test5
    OpenURLWithParams    https://google.com

*** Keywords ***
checkLoginAndLogOutFlow
    Log To Console    Test case executed successfully
    Input Text    id =user-name    standard_user
    Open Context Menu    id =user-name
    Input Password    id = password    secret_sauce
    Click Button    id = login-button
    Click Button    id = react-burger-menu-btn
    Go To    ${url}/logout

OpenBrowserAndNavigateToURL
    Open Browser    ${url}    chrome
    SeleniumLibrary.Maximize Browser Window
    Set Selenium Implicit Wait    25
    ${getSpeed}    Get Selenium Implicit Wait
    Log To Console    ${getSpeed}

settingUpImplicitWait
    Comment    Set Selenium Implicit Wait    5
    ${getImplicitWaitSpeed}    Get Selenium Implicit Wait
    Log To Console    ${getImplicitWaitSpeed}

clickOnWebElement
    Click Element    xpath = //span[@data-cy='closeModal']

OpenURLWithParams
    [Arguments]    ${URL}
    Open Browser    ${URL}    chrome
