*** Settings ***
Documentation   Basic functions of dexterslab Home Page
...             Testing the basic functionality of the 
...             main menu of dexterslab home page
...             

Library         Browser  # Lädt die Browser-Library
Resource        resource.robot


*** Test Cases ***
    [Documentation]   a test for home page main menu
    GIVEN the title of the browser-tab is   Homeoffice 2024
    WHEN the user clicks the button in the left corner
    THEN there occurs a blue menu
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