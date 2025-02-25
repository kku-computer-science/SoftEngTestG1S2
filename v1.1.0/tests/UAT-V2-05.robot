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
TC01: Go To Research Group Page
    Open Browser    ${BASE_URL}/login    ${BROWSER}
    Maximize Browser Window
    Input Username    admin@gmail.com
    Input Password    12345678
    Click Button    Log In
    Location Should Be    ${BASE_URL}/dashboard
    Wait Until Element Is Visible    xpath=//h4    10s
    ${greeting_text} =    Get Text    xpath=//h4
    Should Be Equal As Strings    ${greeting_text}    สวัสดี ผู้ดูแลระบบ -
    Log To Console    ✅ Successfully login ${greeting_text}
    Click Element    xpath=//a[@href="${BASE_URL}/researchGroups"]
    Wait Until Location Is    ${BASE_URL}/researchGroups    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Research Group page

TC02: Edit Member Permission
    Wait Until Element Is Visible    xpath=//td[contains(text(), 'ห้องปฏิบัติการวิจัย ระบบอัจฉริยะและการเรียนรู้เครื่อง (MLIS)')]/following-sibling::td//a[@title="Edit"]    ${TIMEOUT}
    Click Element    xpath=//td[contains(text(), 'ห้องปฏิบัติการวิจัย ระบบอัจฉริยะและการเรียนรู้เครื่อง (MLIS)')]/following-sibling::td//a[@title="Edit"]
    Wait Until Location Is    ${BASE_URL}/researchGroups/8/edit    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Edit page for ห้องปฏิบัติการวิจัย ระบบอัจฉริยะและการเรียนรู้เครื่อง (MLIS)
   
    # เลื่อนลงมาถึง User ที่ต้องการแก้ไข
    Scroll Element Into View    xpath=//button[@type='submit']
    Log To Console    ✅ Successfully scrolled to selected user: "สันติ ทินตะนัย"
    # รอให้ Dropdown permission ปรากฏ
    Wait Until Element Is Visible    xpath=//select[@name="moreFields[users][1][permission]"]    5s
    # เปลี่ยน permission เป็น Edit (value=1)
    Select From List By Value    xpath=//select[@name="moreFields[users][1][permission]"]    1
    Log To Console    ✅ Successfully changed permission to "Edit"
    Scroll Element Into View    xpath=//button[@type='submit']
    Sleep    1s    # รอให้หน้าโหลดสมบูรณ์ก่อนกดปุ่ม (ถ้าจำเป็น)
    Click Button    xpath=//button[@type='submit']
    Log To Console    ✅ Successfully submit research group name

    

