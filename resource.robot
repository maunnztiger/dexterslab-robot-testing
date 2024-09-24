*** Settings ***
Documentation   ressources for all test Cases
...             providing all BDD test phrases with 
...             keywords

*** Keywords ***
the user opens up 
    [Arguments]     ${browser}
    Browser.New Browser     ${browser}  headless=true

opens the Homepage of
    [Arguments]    ${URL}
    New Page    ${URL}

the title of the frontpage's browser-tab is
    [Arguments]      ${tabtitle_1}
    ${page_title} =  Get Title 
    Should Be Equal AS Strings      ${page_title}   ${tabtitle_1}

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

clicks on the menu-link "Men in Homeoffice Data"  
    Browser.Click     id=data_men

a page opens up with the headline
    [Arguments]     ${headline_text}
    ${headline} =   Get Text   id=headline
    Should Be Equal AS Strings      ${headline}   ${headline_text}

the title of the tab is
    [Arguments]      ${tabtitle_2}
    ${page_title} =  Get Title 
    Should Be Equal AS Strings      ${page_title}   ${tabtitle_2}

the user clicks on the button "Create Record"
    Browser.Click     id=create_button

a Popup Window is openning up with the headline
    [Arguments]     ${headline_text}
    ${headline} =   Get Text   xpath=/html/body/div[7]/div[1]/h2
    Should Be Equal AS Strings      ${headline}   ${headline_text}

there is a textfield with the label
    [Arguments]     ${label_text}
    ${label} =   Get Text   xpath=/html/body/div[7]/div[1]/label[1]
    Should Be Equal AS Strings      ${label}   ${label_text}

there is a second textfield with the label
    [Arguments]     ${label_text}
    ${label} =   Get Text   xpath=/html/body/div[7]/div[1]/label[2]
    Should Be Equal AS Strings      ${label}   ${label_text}

there is a third textfield with the label
    [Arguments]     ${label_text}
    ${label} =   Get Text   xpath=/html/body/div[7]/div[1]/label[3]
    Should Be Equal AS Strings      ${label}   ${label_text}

below the textfields there is a button
    [Arguments]     ${button_text}
    ${button} =   Get Text    xpath=/html/body/div[7]/div[2]/button[1]
    Should Be Equal AS Strings      ${button}   ${button_text}

there is a button
    [Arguments]     ${button_text}
    ${button} =   Get Text    xpath=/html/body/div[7]/div[2]/button[2]
    Should Be Equal AS Strings      ${button}   ${button_text}

the user adds a Number to the Id-textfield
    ${number} =   Get Text    xpath=/html/body/div[4]/table/tbody/tr[4]/td[1]
    ${new_number}=   Evaluate   int(${number})+1
    Type Text    xpath=//*[@id="Id"]   ${new_number}

adds the text-value to the Aspekt-textfield
    [Arguments]     ${aspekt_text}
    Type Text    xpath=//*[@id="aspect2"]   ${aspekt_text}

adds the percentage to the Value-textfield
    [Arguments]     ${value_text}
    Type Text    xpath=//*[@id="value2"]   ${value_text}

clicks on the Button "Create Record"
    Browser.Click     xpath=/html/body/div[7]/div[2]/button[1]
    Sleep   3s

the Popup is no longer diplayed on the page
    Wait For Elements State    xpath=//*[@id="popup2"]    hidden

after two seconds the new text-entry appears
    Wait For Elements State    xpath=/html/body/div[4]/table/tbody/tr[5]    visible

the last row "Id"-column has now new text-entry:
    [Arguments]     ${text_entry}
    ${entry}=       Get Text    xpath=/html/body/div[4]/table/tbody/tr[5]/td[1]
    Should Be Equal AS Strings      ${entry}    ${text_entry}

the last row "Aspekt"-column has now the text-entry:
    [Arguments]     ${text_entry}
    ${entry}=       Get Text    xpath=/html/body/div[4]/table/tbody/tr[5]/td[2]
    Should Be Equal AS Strings      ${entry}    ${text_entry}

the last row "Value"-column has now the text-entry:
    [Arguments]     ${text_entry}
    ${entry}=       Get Text    xpath=/html/body/div[4]/table/tbody/tr[5]/td[3]
    Should Be Equal AS Strings      ${entry}    ${text_entry}

the user clicks on the trash-button in the new row
    Wait For Elements State    xpath=/html/body/div[4]/table/tbody/tr[5]/td[5]/button/i   attached
    

the user accepts the alert that is poping up
    Handle Future Dialogs    action=accept
    Browser.Click       xpath=/html/body/div[4]/table/tbody/tr[5]/td[5]/button/i  
    Sleep   3s

the according entry will be deleted from the table
    Wait For Elements State   xpath=/html/body/div[4]/table/tbody/tr[5]    detached

the user clicks on the pencil button on the right of a row
    Browser.Click       xpath=/html/body/div[4]/table/tbody/tr[4]/td[4]/i

the textcontent of the columns are given in the Popup-textfields
    ${aspect_text}=       Get Text      xpath=//*[@id="aspect"]
    ${value_text}=        Get Text      xpath=//*[@id="value"] 
    Should Be Equal AS Strings      ${aspect_text}    ${aspectcolumn_textcontent}
    Should Be Equal AS Strings      ${value_text}    ${valuecolumn_textcontent}

there is a aspekt-textfield with the label
    [Arguments]     ${label_text}
    ${label} =   Get Text   xpath=/html/body/div[7]/div[1]/label[2]
    Should Be Equal AS Strings      ${label}   ${label_text}

there is a value-textfield with the label
    [Arguments]     ${label_text}
    ${label} =   Get Text   xpath=/html/body/div[7]/div[1]/label[3]
    Should Be Equal AS Strings      ${label}   ${label_text}

below the textfields there is a save-button
    [Arguments]     ${button_text}
    ${button} =   Get Text    xpath=/html/body/div[5]/div[2]/button[1]
    Should Be Equal AS Strings      ${button}   ${button_text}

the user clears the according textfields
    Type Text    xpath=//*[@id="aspect"]   ${EMPTY}
    Sleep  1s
    Type Text    xpath=//*[@id="value"]   ${EMPTY}
    Sleep   1s

clicks on the button "Save Changes"
    Browser.Click       xpath=/html/body/div[5]/div[2]/button[1]
    Sleep    1s

adds the value to the Aspekt-textfield
    [Arguments]     ${aspect_text}
    Type Text    xpath=//*[@id="aspect"]   ${aspect_text}

adds the value to the Value-textfield
    [Arguments]     ${value_text}
    Type Text    xpath=//*[@id="value"]   ${value_text}

the fourth row "Aspekt"-column has now the text-entry:
    [Arguments]     ${column_text}
    ${text} =   Get Text    xpath=/html/body/div[4]/table/tbody/tr[4]/td[2]
    Should Be Equal AS Strings      ${text}   ${column_text}

the fourth row "Value"-column has now the text-entry:
    [Arguments]     ${column_text}
    ${text} =   Get Text    xpath=/html/body/div[4]/table/tbody/tr[4]/td[3]
    Should Be Equal AS Strings      ${text}   ${column_text}