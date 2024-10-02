*** Settings ***
Documentation   Basic functions of dexterslab Home Page
...             Testing the basic functionality of the 
...             main menu of dexterslab home page
...             

Library         Browser  # Lädt die Browser-Library
Resource        resources/resource.robot

*** Variables ***
${URL}          http://192.168.178.53:5000
${browser}      firefox
${tabtitle}     Homeoffice 2024
${linktext_1}   Homeoffice General Data
${linktext_2}   Men in Homeoffice Data
${linktext_3}   Homeoffice Special Data
${linktext_4}   Homeoffice: Advantages   
${linktext_5}   Homeoffice: Disadvantages
${linktext_6}   Homeoffice in Europe
${linktext_7}   Homeoffice: Video Statements
${linktext_8}   Text-Resourcen

*** Test Cases ***
Testing Basic functionality
    [Documentation]   a test for home page main menu
    GIVEN the user opens up   firefox
    AND opens the Homepage of dexterslab
    AND the title of the frontpage's browser-tab is   Homeoffice 2024
    WHEN the user clicks the button in the left corner
    THEN there occurs a menu with a blue color
    AND the first menu-point is:    Homeoffice General Data
    AND the second menu-point is:   Men in Homeoffice Data
    AND the third menu-point is:    Homeoffice Special Data     
    AND the fourth menu-point is:   Homeoffice: Advantages
    AND the fifth menu-point is:    Homeoffice: Disadvantages 
    AND the sixth menu-point is:    Homeoffice in Europe
    AND the seventh menu-point is:  Homeoffice: Video Statements 
    AND the eigth menu point is:    Text-Resourcen
    WHEN the user clicks the button in the left corner
    THEN the menu dissapears again