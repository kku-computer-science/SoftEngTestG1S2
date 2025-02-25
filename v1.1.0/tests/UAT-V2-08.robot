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
TC01: Log In Role Headproject Success
    Open Browser    ${BASE_URL}/login    ${BROWSER}
    Maximize Browser Window
    Input Username    sunti@kku.ac.th
    Input Password    123456789
    Click Button    Log In
    Location Should Be    ${BASE_URL}/dashboard
    Wait Until Element Is Visible    xpath=//h4    10s
    ${greeting_text} =    Get Text    xpath=//h4
    Should Be Equal As Strings    ${greeting_text}    สวัสดี ผศ. สันติ ทินตะนัย
    Log To Console    ✅ Successfully login ${greeting_text}
    Click Element    xpath=//a[@href="${BASE_URL}/researchGroups"]
    Wait Until Location Is    ${BASE_URL}/researchGroups    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Research Group page



TC02: Edit ชื่อกลุ่มวิจัย (ภาษาไทย) เป็นค่า null
    Click Element    xpath=//a[@href="${BASE_URL}/researchGroups"]
    Wait Until Location Is    ${BASE_URL}/researchGroups    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Research Group page
    Click Element    xpath=//a[@title="Edit"]
    Wait Until Location Is    ${BASE_URL}/researchGroups/8/edit    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Edit page
    Clear Element Text    name=group_name_th
    # Remove the Input Text line to keep the value empty (null)
    Log To Console    ✅ Successfully edit research group name
    Scroll Element Into View    xpath=//button[@type='submit']
    Sleep    1s    # รอให้หน้าโหลดสมบูรณ์ก่อนกดปุ่ม
    Click Button    xpath=//button[@type='submit']
    Log To Console    ✅ Successfully submit research group name
    # ตรวจสอบข้อความเตือน
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'alert-danger')]    ${TIMEOUT}
    Element Should Contain    xpath=//div[contains(@class, 'alert-danger')]    The group name th field is required.
    Log To Console    ✅ Test passed, error message shown as expected

TC03: Edit ชื่อกลุ่มวิจัย (Englist) เป็นค่า null
    Click Element    xpath=//a[@href="${BASE_URL}/researchGroups"]
    Wait Until Location Is    ${BASE_URL}/researchGroups    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Research Group page
    Click Element    xpath=//a[@title="Edit"]
    Wait Until Location Is    ${BASE_URL}/researchGroups/8/edit    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Edit page
    Clear Element Text    name=group_name_en
    # Remove the Input Text line to keep the value empty (null)
    Log To Console    ✅ Successfully edit research group name
    Scroll Element Into View    xpath=//button[@type='submit']
    Sleep    1s    # รอให้หน้าโหลดสมบูรณ์ก่อนกดปุ่ม
    Click Button    xpath=//button[@type='submit']
    Log To Console    ✅ Successfully submit research group name
    # ตรวจสอบข้อความเตือน
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'alert-danger')]    ${TIMEOUT}
    Element Should Contain    xpath=//div[contains(@class, 'alert-danger')]    The group name en field is required.
    Log To Console    ✅ Test passed, error message shown as expected

TC04: Edit ชื่อกลุ่มวิจัย (Englist) เป็นค่า null
    Click Element    xpath=//a[@href="${BASE_URL}/researchGroups"]
    Wait Until Location Is    ${BASE_URL}/researchGroups    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Research Group page
    Click Element    xpath=//a[@title="Edit"]
    Wait Until Location Is    ${BASE_URL}/researchGroups/8/edit    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Edit page
    Clear Element Text    name=group_name_th
    Clear Element Text    name=group_name_en
    # Remove the Input Text line to keep the value empty (null)
    Log To Console    ✅ Successfully edit research group name
    Scroll Element Into View    xpath=//button[@type='submit']
    Sleep    1s    # รอให้หน้าโหลดสมบูรณ์ก่อนกดปุ่ม
    Click Button    xpath=//button[@type='submit']
    Log To Console    ✅ Successfully submit research group name
    # ตรวจสอบข้อความเตือน
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'alert-danger')]    ${TIMEOUT}
    Element Should Contain    xpath=//div[contains(@class, 'alert-danger')]    The group name th field is required.
    Element Should Contain    xpath=//div[contains(@class, 'alert-danger')]    The group name en field is required.
    Log To Console    ✅ Test passed, error messages shown as expected

TC05: Edit เพิ่มสมาชิกกลุ่มวิจัยที่เป็นสมาชิกอยู่แล้ว
    Click Element    xpath=//a[@href="${BASE_URL}/researchGroups"]
    Wait Until Location Is    ${BASE_URL}/researchGroups    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Research Group page
    Click Element    xpath=//a[@title="Edit"]
    Wait Until Location Is    ${BASE_URL}/researchGroups/8/edit    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Edit page
    
    # คลิกปุ่มเพิ่มสมาชิก
    Scroll Element Into View    xpath=//button[@id='add-btn2']
    Click Button    xpath=//button[@id='add-btn2']
    Log To Console    ✅ Successfully clicked Add button
    
    # เลื่อนลงมาจนถึง Dropdown
    Scroll Element Into View    xpath=//span[@id='select2-selUser4-container']
    Click Element    xpath=//span[@id='select2-selUser4-container']
    
    # พิมพ์ชื่อ "สันติ ทินตะนัย" ในช่องค้นหา
    Input Text    xpath=//input[@class='select2-search__field']    สันติ ทินตะนัย
    Wait Until Element Is Visible    xpath=//li[contains(@class, 'select2-results__option') and text()='สันติ ทินตะนัย']    5s
    Scroll Element Into View    xpath=//li[contains(@class, 'select2-results__option') and text()='สันติ ทินตะนัย']
    Click Element    xpath=//li[contains(@class, 'select2-results__option') and text()='สันติ ทินตะนัย']
    Log To Console    ✅ Successfully selected "สันติ ทินตะนัย" from the dropdown

    # เลือกค่า "Post-Doc" จาก Dropdown
    Wait Until Element Is Visible    xpath=//select[@name="moreFields[users][4][role]"]    5s
    Select From List By Value    xpath=//select[@name="moreFields[users][4][role]"]    3
    Log To Console    ✅ Successfully selected "Post-Doc" for "สันติ ทินตะนัย"

    # กด Submit
    Scroll Element Into View    xpath=//button[@type='submit']
    Sleep    1s
    Click Button    xpath=//button[@type='submit']
    Log To Console    ✅ Successfully submit research group update
    
    # ตรวจสอบว่า URL ยังคงเป็นหน้าสำหรับแก้ไข (Edit Page)
    Wait Until Location Is    ${BASE_URL}/researchGroups/8/edit    ${TIMEOUT}
    Log To Console    ✅ Test passed: Still on Edit Page after submission

TC06: Edit เพิ่ม visitor ซ้ำคนเดิม
    Click Element    xpath=//a[@href="${BASE_URL}/researchGroups"]
    Wait Until Location Is    ${BASE_URL}/researchGroups    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Research Group page
    Click Element    xpath=//a[@title="Edit"]
    Wait Until Location Is    ${BASE_URL}/researchGroups/8/edit    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Edit page
    # เลื่อนลงมาจนกว่าจะเห็นปุ่ม Add
    Scroll Element Into View    xpath=//button[@id='add-btn2-authors']
    # คลิกปุ่ม Add
    Click Element    xpath=//button[@id='add-btn2-authors']
    Log To Console    ✅ Successfully clicked "Add" button
    # เลื่อนลงมาถึง element ที่ต้องการ
    Sleep    2s    # รอให้ DOM อัพเดท
    Scroll Element Into View    xpath=(//span[contains(@class, 'select2-selection__rendered')])[last()]
    # คลิกที่ dropdown ล่าสุดที่เพิ่งถูกสร้าง
    Click Element    xpath=(//span[contains(@class, 'select2-selection__rendered')])[last()]
    Log To Console    ✅ Successfully clicked the dropdown
    # พิมพ์ชื่อ "Loan Thi-Thuy Ho" ในช่องค้นหา
    Input Text    xpath=//input[@class='select2-search__field']    Loan Thi-Thuy Ho
    # รอให้ตัวเลือกแสดงขึ้นมา
    Wait Until Element Is Visible    xpath=//li[contains(@class, 'select2-results__option') and text()='Loan Thi-Thuy Ho']    5s
    # คลิกเลือกชื่อ "Loan Thi-Thuy Ho"
    Click Element    xpath=//li[contains(@class, 'select2-results__option') and text()='Loan Thi-Thuy Ho']
    Log To Console    ✅ Successfully selected "Loan Thi-Thuy Ho" from the dropdown
    Scroll Element Into View    xpath=//button[@type='submit']
    Sleep    1s    # รอให้หน้าโหลดสมบูรณ์ก่อนกดปุ่ม
    Click Button    xpath=//button[@type='submit']
    Log To Console    ✅ Successfully submit research group name
   
    Click Element    xpath=//a[@href="${BASE_URL}/researchGroups"]
    Wait Until Location Is    ${BASE_URL}/researchGroups    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Research Group page
    Click Element    xpath=//a[@title="Edit"]
    Wait Until Location Is    ${BASE_URL}/researchGroups/8/edit    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Edit page
    # เลื่อนลงมาจนกว่าจะเห็นปุ่ม Add
    Scroll Element Into View    xpath=//button[@id='add-btn2-authors']
    # คลิกปุ่ม Add
    Click Element    xpath=//button[@id='add-btn2-authors']
    Log To Console    ✅ Successfully clicked "Add" button
    # เลื่อนลงมาถึง element ที่ต้องการ
    Sleep    2s    # รอให้ DOM อัพเดท
    Scroll Element Into View    xpath=//button[@type='submit']
    # คลิกที่ dropdown ล่าสุดที่เพิ่งถูกสร้าง
    Click Element    xpath=(//span[contains(@class, 'select2-selection__rendered')])[last()]
    Log To Console    ✅ Successfully clicked the dropdown
    # พิมพ์ชื่อ "Loan Thi-Thuy Ho" ในช่องค้นหา
    Input Text    xpath=//input[@class='select2-search__field']    Loan Thi-Thuy Ho
    # รอให้ตัวเลือกแสดงขึ้นมา
    Wait Until Element Is Visible    xpath=//li[contains(@class, 'select2-results__option') and text()='Loan Thi-Thuy Ho']    5s
    # คลิกเลือกชื่อ "Loan Thi-Thuy Ho"
    Click Element    xpath=//li[contains(@class, 'select2-results__option') and text()='Loan Thi-Thuy Ho']
    Log To Console    ✅ Successfully selected "Loan Thi-Thuy Ho" from the dropdown
    Scroll Element Into View    xpath=//button[@type='submit']
    Sleep    1s    # รอให้หน้าโหลดสมบูรณ์ก่อนกดปุ่ม
    Click Button    xpath=//button[@type='submit']
    Log To Console    ✅ Successfully submit research group name
    # ตรวจสอบว่า URL ยังคงเป็นหน้าสำหรับแก้ไข (Edit Page)
    Wait Until Location Is    ${BASE_URL}/researchGroups/8/edit    ${TIMEOUT}
    Log To Console    ✅ Test passed: Still on Edit Page after submission
    # เลื่อนลงมาถึงตัวเลือกที่ต้องการ
    scroll Element Into View    xpath=//button[@type='submit']
    # ลบสมาชิกกลุ่มวิจัย (ใช้การค้นหาปุ่มโดยไม่ใช้ข้อความ)
    Click Element    xpath=//td[contains(.,'Loan Thi-Thuy Ho')]/following-sibling::td/button[contains(@class,'btn-danger')]
    Log To Console    ✅ Successfully clicked "Remove" button.
    # ตรวจสอบผลลัพธ์การลบสมาชิก
    Wait Until Element Is Not Visible    xpath=//span[@id='select2-selUser3-container' and text()='Loan Thi-Thuy Ho']    ${TIMEOUT}
    Log To Console    ✅ Member "Loan Thi-Thuy Ho" was successfully removed.
    Scroll Element Into View    xpath=//button[@type='submit']
    Sleep    1s    # รอให้หน้าโหลดสมบูรณ์ก่อนกดปุ่ม (ถ้าจำเป็น)
    Click Button    xpath=//button[@type='submit']
    Log To Console    ✅ Successfully submit research group name

    



