*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BASE_URL}    https://cs0165.cpkkuhost.com
${BROWSER}    chrome
${OVERLAY_XPATH}    //div[contains(@class, 'overlay')]//div[contains(text(), 'Intelligent Systems and Machine Learning Research Laboratory')]
${TIMEOUT}    5

*** Keywords ***
Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

*** Test Cases ***
TC01: Open Home Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Log To Console    ✅ Successfully Open Home page
    Sleep    1s

TC02: Go To Login Page
    Click Element    xpath=//a[@href='/login']
    Sleep    2s
    ${handles} =    Get Window Handles
    Switch Window    ${handles}[1]  # สลับไปยังแท็บที่ 2 (index เริ่มจาก 0)
    ${current_url} =    Get Location
    Log To Console    ✅ Current URL: ${current_url}
    Wait Until Location Is    ${BASE_URL}/login    ${TIMEOUT}
    Log To Console    ✅ Successfully opened Login page

TC03: Log In Role Headproject Success
    Input Username    wongsar@kku.ac.th
    Input Password    123456789
    Click Button    Log In

    # รอให้ Element บน Dashboard ปรากฏแทนการเช็ค URL
    Wait Until Element Is Visible    xpath=//h4[contains(text(), 'สวัสดี ศ.ดร. ศาสตรา วงศ์ธนวสุ')]    10s
    Log To Console    ✅ Successfully logged in and redirected to Dashboard






