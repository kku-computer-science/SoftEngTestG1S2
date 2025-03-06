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
    Input Username    admin@gmail.com
    Input Password    12345678
    Click Button    Log In

    # รอให้ Element ปรากฏบนหน้า (รอให้ <h4> โหลด)
    Wait Until Element Is Visible    xpath=//h4    10s
    ${actual_text} =    Get Text    xpath=//h4
    Log To Console    🚀 Found Text: ${actual_text}

    # เช็คว่าใน <h4> มีคำว่า "สวัสดี" หรือไม่
    Wait Until Element Contains    xpath=//h4    สวัสดี ผู้ดูแลระบบ -    10s
    Log To Console    ✅ Successfully logged in and redirected to Dashboard



