*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${CountOfItems}    2    # How many items will be added to Basket
${Url}            https://www.alza.sk    # Url of shop
${Browser}        chrome    # Browser usd for testing
${Temp}           ${EMPTY}    # Temporary variable
${Counter}        ${EMPTY}    # FOR cycle Counter

*** Test Cases ***
AlzaTest
    [Documentation]    Test for add two most expensive products to basket.
    Wait Until Keyword Succeeds    1x    30s    Open Catalog
    FOR    ${COUNTER}    IN RANGE    ${CountOfItems}
        Wait Until Keyword Succeeds    1x    30s    Basket    ${Counter}
    END

*** Keywords ***
Open Catalog
    [Documentation]    Keyword(function) to open page and go to catalog "Notebooky"
    Open Browser    ${Url}    ${Browser}
    Wait Until Page Contains Element    link=Rozumiem
    Click Link    link=Rozumiem
    Wait Until Page Contains Element    link=Počítače a notebooky
    Click Link    link=Počítače a notebooky
    Wait Until Page Contains Element    link=Notebooky
    Click Link    link=Notebooky
    Wait Until Keyword Succeeds    1x    30s    Alzak

Basket
    [Arguments]    ${i}
    [Documentation]    Keyword(function) to add item to basket
    ...    ${i} order number
    Wait Until Keyword Succeeds    1x    30s    Alzak
    Wait Until Page Contains Element    link=Najdrahšie
    Click Link    link=Najdrahšie
    Wait Until Keyword Succeeds    1x    30s    Alzak
    Wait Until Page Contains Element    link=Kúpiť
    ${Temp}=    Evaluate    ${i} + 1
    Click Link    xpath=//div[@id='boxc']/div/div[${Temp}]/div[@class='bottom']/div/span/a[@class='btnk1']
    Wait Until Keyword Succeeds    1x    30s    Alzak
    Wait Until Page Contains Element    link=Späť
    Click Link    xpath=//div[@class='cross-page']/div/a[@href='/Order1.htm']
    Wait Until Page Contains Element    link=Späť k nákupu
    Click Link    link=Späť k nákupu

Alzak
    [Documentation]    Keyword(function) to remove alzak(alza support element which hiding elements): it is random so this is hard to test
    Wait Until Keyword Succeeds    1x    30s    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='vendor-close']
    ${Temp}    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='vendor-close']
    Run Keyword If    $Temp    Click Element    xpath=//div[@id='vendor-close']
