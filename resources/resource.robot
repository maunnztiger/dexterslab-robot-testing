*** Settings ***
Documentation   ressources for all test Cases
...             providing all BDD test phrases with 
...             keywords

Library         OperatingSystem
Library         Collections
Library         JSONLibrary
Library         ../Utils/json_utils.py

*** Variables ***
${TABLE_XPATH}      /html/body/div[4]/table 
${JSON_FILE_PATH}   ${CURDIR}${/}data_men.json
${JSON_PATH}      ${CURDIR}${/}table.json

*** Keywords ***
the user opens up 
    [Arguments]     ${browser}
    Browser.New Browser     ${browser}  headless=true

opens the Homepage of dexterslab
    ${file}     Load JSON From File     ${CURDIR}${/}config.json
    ${dexterslab_url}   Get Value From Json         ${file}     $.DEXTERSLAB_URL           
    New Page    ${dexterslab_url}[0]

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
    Sleep   10s

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
    Sleep    5s

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

the page has a dropdown with selected number
    [Arguments]     ${number}
    ${dropdown_number} =   Get Text    xpath=/html/body/div[4]/div[1]/label/select/option[3]
    Should Be Equal AS Strings      ${number}   ${dropdown_number}

in the right corner the page contains a search bar
    Wait For Elements State    xpath=/html/body/div[4]/div[2]/label/input   visible

the page contains a dark blue colored button with the text
    [Arguments]     ${button_text}
    ${text} =   Get Text    xpath=//*[@id="returnButton"]
    Should Be Equal AS Strings      ${text}   ${button_text}

the page contains another blue button with the text
    [Arguments]     ${button_text}
    ${text} =   Get Text    xpath=//*[@id="create_button"]
    Should Be Equal AS Strings      ${text}   ${button_text}

the page contains a table with number of entries
    [Arguments]     ${number_of_rows}
    ${rows} =  get element count   xpath=/html/body/div[4]/table/tbody/tr
    log to console  ${rows}
    Should Be Equal AS Strings      ${rows}   ${number_of_rows}

AND the table has number of columns
    [Arguments]     ${number_of_rows}
    ${rows} =  get element count   xpath=/html/body/div[4]/table/tbody/tr[1]/td
    log to console  ${rows}
    Should Be Equal AS Strings      ${rows}   ${number_of_rows}

the first column has the title
    [Arguments]     ${column_title}
    ${title} =   Get Text    xpath=/html/body/div[4]/table/thead/tr/th[1]
    Should Be Equal AS Strings      ${title}   ${column_title}

the second column has the title
    [Arguments]     ${column_title}
    ${title} =   Get Text    xpath=/html/body/div[4]/table/thead/tr/th[2]
    Should Be Equal AS Strings      ${title}   ${column_title}

the third column has the title
    [Arguments]     ${column_title}
    ${title} =   Get Text    xpath=/html/body/div[4]/table/thead/tr/th[3]
    Should Be Equal AS Strings      ${title}   ${column_title}

the fourth column contains an edit-button and a delete-button
    Wait For Elements State    xpath=/html/body/div[4]/table/tbody/tr[1]/td[4]/i            visible
    Wait For Elements State    xpath=/html/body/div[4]/table/tbody/tr[1]/td[5]/button/i     visible

the the rows have certain text-entries
    ${table_data}=       Create List
    
    ${row1_col1}=    Get Text    xpath=${TABLE_XPATH}//tr[1]/td[1]
    ${row1_col2}=    Get Text    xpath=${TABLE_XPATH}//tr[1]/td[2]
    ${row1_col3}=    Get Text    xpath=${TABLE_XPATH}//tr[1]/td[3]
    
    ${row_1}=    Create Dictionary    Id=0    Aspekt=${row1_col2}    Value=${row1_col3}
    ${row_a}=    Evaluate       json.dumps(${row_1})
    
    ${row2_col1}=    Get Text    xpath=${TABLE_XPATH}//tr[2]/td[1]
    ${row2_col2}=    Get Text    xpath=${TABLE_XPATH}//tr[2]/td[2]
    ${row2_col3}=    Get Text    xpath=${TABLE_XPATH}//tr[2]/td[3]
    
    ${row_2}=    Create Dictionary    Id=1    Aspekt=${row2_col2}    Value=${row2_col3}
    ${row_b}=    Evaluate       json.dumps(${row_2})
    
    ${row3_col1}=    Get Text    xpath=${TABLE_XPATH}//tr[3]/td[1]
    ${row3_col2}=    Get Text    xpath=${TABLE_XPATH}//tr[3]/td[2]
    ${row3_col3}=    Get Text    xpath=${TABLE_XPATH}//tr[3]/td[3]

    ${row_3}=    Create Dictionary    Id=2    Aspekt=${row3_col2}    Value=${row3_col3}
    ${row_c}=    Evaluate       json.dumps(${row_3})
    
    ${row4_col1}=    Get Text    xpath=${TABLE_XPATH}//tr[4]/td[1]
    ${row4_col2}=    Get Text    xpath=${TABLE_XPATH}//tr[4]/td[2]
    ${row4_col3}=    Get Text    xpath=${TABLE_XPATH}//tr[4]/td[3]

    ${row_4}=    Create Dictionary    Id=3    Aspekt=${row4_col2}    Value=${row4_col3}
    ${row_d}=    Evaluate       json.dumps(${row_4}, ensure_ascii=False, indent=4)
    
    
    Append To List    ${table_data}    ${row_a}
    Append To List    ${table_data}    ${row_b}
    Append To List    ${table_data}    ${row_c}
    Append To List    ${table_data}    ${row_d}
    ${json_data}=    Convert To String    ${table_data}
    ${valid_json_data}=    json_utils.convert_to_json_string   ${json_data}
    Create File    ${JSON_PATH}    ${valid_json_data}
    
    ${file_path}   Set Variable    ${JSON_FILE_PATH}
    json_utils.verify_json_data    ${JSON_PATH}   ${file_path}

    