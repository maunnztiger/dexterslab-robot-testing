*** Settings ***
Documentation   Button functions of dexterslab table page
...             Testing the buttons functionalities of the 
...             dexterslab table page
...             

Library         Browser
                
Resource        resource.robot

*** Variables ***
${aspectcolumn_textcontent}     Männer, die prinzipiell kein Homeoffice machen wollen
${valuecolumn_textcontent}      2%

*** Test Cases ***
Testing Create Button functionality
    [Documentation]   a test for table pages create button
    GIVEN the user opens up   firefox
    AND opens the Homepage of   dexterslab
    AND the title of the frontpage's browser-tab is   Homeoffice 2024
    WHEN the user clicks the button in the left corner
    AND clicks on the menu-link "Men in Homeoffice Data"
    THEN a page opens up with the headline   Men in Homeoffice Data
    AND the title of the tab is   Men in Homeoffice Data
    WHEN the user clicks on the button "Create Record"
    THEN a Popup Window is openning up with the headline   Edit Row
    AND there is a textfield with the label          Id:
    AND there is a second textfield with the label   Aspekt:
    AND there is a third textfield with the label    Value:
    AND below the textfields there is a button  Create Record
    AND there is a button   Cancel
    WHEN the user adds a Number to the Id-textfield
    AND adds the text-value to the Aspekt-textfield   Männer, die kein Homeoffice machen wollen
    AND adds the percentage to the Value-textfield   2%
    AND clicks on the Button "Create Record"
    THEN the Popup is no longer diplayed on the page
    AND after two seconds the new text-entry appears 
    AND the last row "Id"-column has now new text-entry:     4
    AND the last row "Aspekt"-column has now the text-entry:   Männer, die kein Homeoffice machen wollen
    AND the last row "Value"-column has now the text-entry:   2%
    WHEN the user clicks on the trash-button in the new row
    AND the user accepts the alert that is poping up
    THEN the according entry will be deleted from the table

Testing Edit Button functionality
    [Documentation]     a test for the tables pages edit button
    Given the user opens up     firefox
    AND opens the Homepage of   http://192.168.178.53:5000
    AND the title of the frontpage's browser-tab is   Homeoffice 2024
    WHEN the user clicks the button in the left corner
    AND clicks on the menu-link "Men in Homeoffice Data"
    THEN a page opens up with the headline   Men in Homeoffice Data
    AND the title of the tab is   Men in Homeoffice Data
    WHEN the user clicks on the pencil button on the right of a row
    THEN a Popup Window is openning up with the headline   Edit Row
    AND there is a aspekt-textfield with the label   Aspekt:
    AND there is a value-textfield with the label    Value:
    AND below the textfields there is a save-button  Save Changes
    AND there is a button   Cancel
    AND the textcontent of the columns are given in the Popup-textfields
    When the user clears the according textfields
    AND adds the value to the Aspekt-textfield    Männer, die prinzipiell kein Homeoffice machen wollen
    AND adds the value to the Value-textfield     2%
    AND clicks on the button "Save Changes"
    THEN the fourth row "Aspekt"-column has now the text-entry:       Männer, die prinzipiell kein Homeoffice machen wollen  
    AND the fourth row "Value"-column has now the text-entry:   2%