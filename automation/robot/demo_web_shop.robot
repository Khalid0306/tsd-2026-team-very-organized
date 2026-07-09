*** Settings ***
Library           SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables ***
${BASE_URL}       https://demowebshop.tricentis.com
${BROWSER}        chrome
# TODO: remplace ces deux valeurs par le compte partage (docs/test-plan.md)
${EMAIL}          emilienhuret@gmail.com
${PASSWORD}       fortnite1234
${VALID_SEARCH}   book

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${BASE_URL}/login    ${BROWSER}
    Maximize Browser Window
    Title Should Be    Demo Web Shop. Login

Submit Login Form
    [Arguments]    ${email}    ${password}
    Input Text        id=Email       ${email}
    Input Password    id=Password    ${password}
    Click Button      css=input[value="Log in"]

*** Test Cases ***
TC-001 Login With Valid Credentials Should Succeed
    [Documentation]    Positif : connexion avec un compte valide -> acces au compte utilisateur.
    Open Browser To Login Page
    Submit Login Form    ${EMAIL}    ${PASSWORD}
    Page Should Contain    Log out

TC-NEG-001 Login With Wrong Password Should Show Error
    [Documentation]    Negatif : mauvais mot de passe -> message d'erreur affiche.
    Open Browser To Login Page
    Submit Login Form    ${EMAIL}    wrong-password-intentional
    Page Should Contain    Login was unsuccessful