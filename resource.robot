*** Settings ***
Documentation   ressources for all test Cases
...             providing all test cases with 
...             variables and keywords




*** Keywords ***
the user opens up 
    [Arguments]     ${browser}
    Browser.New Browser     ${browser}  headless=false
opens the Homepgage of
    [Arguments]    ${URL}
    New Page    ${URL}
the title of the frontpage's browser-tab is
    [Arguments]      ${tabtitle}
    ${page_title} =  Get Title 
    Should Be Equal AS Strings      ${page_title}   ${tabtitle}
the user clicks the button in the left corner
    Browser.Click     id=menuButton 
there occurs a menu with a blue color
    ${bgcolor}    Get Style    id=menu      color
    Should Contain   ${bgcolor}     rgb(255, 255, 255)
the first menu-point is:
    [Arguments]     ${linktext_1}
    ${linktText} =   Get Text   id=data_general
    Should Be Equal AS Strings      ${linktText}   ${linktext_1}
the second menu-point is:
    [Arguments]     ${linktext_2}
    ${linktText} =   Get Text   id=data_men
    Should Be Equal AS Strings      ${linktText}   ${linktext_2}
the third menu-point is:
    [Arguments]     ${linktext_3}
    ${linktText} =   Get Text   id=data_special
    Should Be Equal AS Strings      ${linktText}   ${linktext_3}
the fourth menu-point is:
    [Arguments]     ${linktext_4}
    ${linktText} =   Get Text   id=data_advantages
    Should Be Equal AS Strings      ${linktText}   ${linktext_4}
the fifth menu-point is:
    [Arguments]     ${linktext_5}
    ${linktText} =   Get Text   id=data_disadvantages
    Should Be Equal AS Strings      ${linktText}   ${linktext_5}
the sixth menu-point is:
    [Arguments]     ${linktext_6}
    ${linktText} =   Get Text   id=data_european_comparation
    Should Be Equal AS Strings      ${linktText}   ${linktext_6}
the seventh menu-point is:
    [Arguments]     ${linktext_7}
    ${linktText} =   Get Text   id=video_list
    Should Be Equal AS Strings      ${linktText}   ${linktext_7}
the eigth menu point is:
    [Arguments]     ${linktext_8}
    ${linktText} =   Get Text   id=text_resources
    Should Be Equal AS Strings      ${linktText}   ${linktext_8}
the menu dissapears again
    ${position}    Get Style    id=data_men      display
    Sleep   2s
    Should Contain   ${position}     block
   
