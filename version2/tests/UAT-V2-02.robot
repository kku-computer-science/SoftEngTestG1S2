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
    Input Username    wongsar@kku.ac.th
    Input Password    123456789
    Click Button    Log In
    Location Should Be    ${BASE_URL}/dashboard
    Wait Until Element Is Visible    xpath=//h4    10s
    ${greeting_text} =    Get Text    xpath=//h4
    Should Be Equal As Strings    ${greeting_text}    สวัสดี ศ.ดร. ศาสตรา วงศ์ธนวสุ
    Log To Console    ✅ Successfully login ${greeting_text}

TC02: Edit ชื่อกลุ่มวิจัย (ภาษาไทย) Success
    Click Element    xpath=//a[@href="${BASE_URL}/researchGroups"]
    Wait Until Location Is    ${BASE_URL}/researchGroups    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Research Group page
    Click Element    xpath=//a[@title="Edit"]
    Wait Until Location Is    ${BASE_URL}/researchGroups/8/edit    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Edit page
    Clear Element Text    name=group_name_th
    Input Text    name=group_name_th    ทดสอบแก้ไขชื่อกลุ่มวิจัย (ภาษาไทย)
    Log To Console    ✅ Successfully edit research group name
    Scroll Element Into View    xpath=//button[@type='submit']
    Sleep    1s    # รอให้หน้าโหลดสมบูรณ์ก่อนกดปุ่ม (ถ้าจำเป็น)
    Click Button    xpath=//button[@type='submit']
    Log To Console    ✅ Successfully submit research group name
    Click Element    xpath=//a[@href="${BASE_URL}/researchGroups"]
    Wait Until Location Is    ${BASE_URL}/researchGroups    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Research Group page
    Click Element    xpath=//a[@title="Edit"]
    Wait Until Location Is    ${BASE_URL}/researchGroups/8/edit    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Edit page
    Clear Element Text    name=group_name_th
    Input Text    name=group_name_th    ห้องปฏิบัติการวิจัย ระบบอัจฉริยะและการเรียนรู้เครื่อง (MLIS)
    Log To Console    ✅ Successfully edit research group name
    Scroll Element Into View    xpath=//button[@type='submit']
    Sleep    1s    # รอให้หน้าโหลดสมบูรณ์ก่อนกดปุ่ม (ถ้าจำเป็น)
    Click Button    xpath=//button[@type='submit']
    Log To Console    ✅ Successfully submit research group name

TC03: Edit เพิ่มสมาชิกกลุ่มวิจัย Success
    Click Element    xpath=//a[@href="${BASE_URL}/researchGroups"]
    Wait Until Location Is    ${BASE_URL}/researchGroups    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Research Group page
    Click Element    xpath=//a[@title="Edit"]
    Wait Until Location Is    ${BASE_URL}/researchGroups/8/edit    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Edit page
    Scroll Element Into View    xpath=//button[@id='add-btn2']
    Click Button    xpath=//button[@id='add-btn2']
    Log To Console    ✅ Successfully clicked Add button
    # เลื่อนลงมาจนถึง Dropdown
    Scroll Element Into View    xpath=//span[@id='select2-selUser4-container']
    # คลิกเปิด Dropdown
    Click Element    xpath=//span[@id='select2-selUser4-container']
    # พิมพ์ชื่อ "งามนิจ อาจอินทร์" ในช่องค้นหา
    Input Text    xpath=//input[@class='select2-search__field']    งามนิจ อาจอินทร์
    # รอให้ตัวเลือกแสดงขึ้นมา
    Wait Until Element Is Visible    xpath=//li[contains(@class, 'select2-results__option') and text()='งามนิจ อาจอินทร์']    5s
    # เลื่อนลงมาถึงตัวเลือก
    Scroll Element Into View    xpath=//li[contains(@class, 'select2-results__option') and text()='งามนิจ อาจอินทร์']
    # คลิกเลือกชื่อ "งามนิจ อาจอินทร์"
    Click Element    xpath=//li[contains(@class, 'select2-results__option') and text()='งามนิจ อาจอินทร์']
    Log To Console    ✅ Successfully selected "งามนิจ อาจอินทร์" from the dropdown
    # รอให้ Dropdown ปรากฏ
    Wait Until Element Is Visible    xpath=//select[@name="moreFields[users][4][role]"]    5s
    # เลือกค่า "Post-Doc" จาก Dropdown
    Select From List By Value    xpath=//select[@name="moreFields[users][4][role]"]    3
    # หรือใช้ Select From List By Label
    # Select From List By Label    xpath=//select[@name="moreFields[users][4][role]"]    Post-Doc
    Log To Console    ✅ Successfully selected "Post-Doc" for "งามนิจ อาจอินทร์"
    Scroll Element Into View    xpath=//button[@type='submit']
    Sleep    1s    # รอให้หน้าโหลดสมบูรณ์ก่อนกดปุ่ม (ถ้าจำเป็น)
    Click Button    xpath=//button[@type='submit']
    Log To Console    ✅ Successfully submit research group name

TC04: Edit เพิ่มOther Visitors Success
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
    Scroll Element Into View    xpath=//span[@id='select2-selAuthor1-container']
    # คลิกที่ span ที่มี id=select2-selAuthor1-container
    Click Element    xpath=//span[@id='select2-selAuthor1-container']
    Log To Console    ✅ Successfully clicked the dropdown
    # พิมพ์ชื่อ "Loan Thi-Thuy Ho" ในช่องค้นหา
    Input Text    xpath=//input[@class='select2-search__field']    Loan Thi-Thuy Ho
    # รอให้ตัวเลือกแสดงขึ้นมา
    Wait Until Element Is Visible    xpath=//li[contains(@class, 'select2-results__option') and text()='Loan Thi-Thuy Ho']    5s
    # คลิกเลือกชื่อ "Loan Thi-Thuy Ho"
    Click Element    xpath=//li[contains(@class, 'select2-results__option') and text()='Loan Thi-Thuy Ho']
    Log To Console    ✅ Successfully selected "Loan Thi-Thuy Ho" from the dropdown
    Scroll Element Into View    xpath=//button[@type='submit']
    Sleep    1s    # รอให้หน้าโหลดสมบูรณ์ก่อนกดปุ่ม (ถ้าจำเป็น)
    Click Button    xpath=//button[@type='submit']
    Log To Console    ✅ Successfully submit research group name


TC05: Edit ลบสมาชิกกลุ่มวิจัย Success
    Click Element    xpath=//a[@href="${BASE_URL}/researchGroups"]
    Wait Until Location Is    ${BASE_URL}/researchGroups    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Research Group page
    Click Element    xpath=//a[@title="Edit"]
    Wait Until Location Is    ${BASE_URL}/researchGroups/8/edit    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Edit page
    # เลื่อนลงมาถึงตัวเลือกที่ต้องการ
    scroll Element Into View    xpath=//button[@type='submit']
    # ลบสมาชิกกลุ่มวิจัย (ใช้การค้นหาปุ่มโดยไม่ใช้ข้อความ)
    Click Element    xpath=//span[contains(text(),'งามนิจ อาจอินทร์')]/ancestor::tr//button[contains(@class,'remove-tr')]
    Log To Console    ✅ Successfully clicked "Remove" button.
    # ตรวจสอบผลลัพธ์การลบสมาชิก
    Wait Until Element Is Not Visible    xpath=//span[@id='select2-selUser3-container' and text()='งามนิจ อาจอินทร์']    ${TIMEOUT}
    Log To Console    ✅ Member "งามนิจ อาจอินทร์" was successfully removed.
    Scroll Element Into View    xpath=//button[@type='submit']
    Sleep    1s    # รอให้หน้าโหลดสมบูรณ์ก่อนกดปุ่ม (ถ้าจำเป็น)
    Click Button    xpath=//button[@type='submit']
    Log To Console    ✅ Successfully submit ลบสมาชิกกลุ่มวิจัย Success


TC06: Edit ลบOther Visitors Success
    Click Element    xpath=//a[@href="${BASE_URL}/researchGroups"]
    Wait Until Location Is    ${BASE_URL}/researchGroups    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Research Group page
    Click Element    xpath=//a[@title="Edit"]
    Wait Until Location Is    ${BASE_URL}/researchGroups/8/edit    ${TIMEOUT}
    Log To Console    ✅ Successfully navigated to Edit page
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



    










