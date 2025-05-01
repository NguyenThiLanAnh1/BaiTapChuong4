*** Settings ***
Documentation   Viet test case trang login OrangeHRM
Library   SeleniumLibrary

*** Variables ***
${URL}         https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${USERNAME}    Admin
${PASSWORD}    admin123
${USERNAME1}   abc
${PASSWORD1}   123

*** Test Cases ***
Valid Login
    #1.Mo trinh duyet
    Mo trinh duyet
    #2.Dang nhap
    Dang nhap    ${USERNAME}    ${PASSWORD}
    #3.Kiem tra dang nhap thanh cong
    Kiem tra dang nhap thanh cong


Invalid Login
    #1.Mo trinh duyet
    Mo trinh duyet
    #2.Dang nhap
    Dang nhap     ${USERNAME1}    ${PASSWORD1}
    #3.Kiem tra dang nhap that bai
    Kiem tra dang nhap that bai
  

*** Keywords ***
Mo trinh duyet
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@name='username']    

Dang nhap
    [Arguments]   ${USERNAME}    ${PASSWORD}
    Input Text    xpath=//input[@name='username']    ${USERNAME}
    Input Text    xpath=//input[@name='password']    ${PASSWORD}
    Click Button  xpath=//button[@type="submit"]

Kiem tra dang nhap thanh cong
    Wait Until Page Contains    Dashboard    
    Page Should Contain         Dashboard

Kiem tra dang nhap that bai
    Wait Until Page Contains    Invalid credentials    
    Page Should Contain         Invalid credentials


