*** Settings ***
Documentation   testing the content of "Men in Homeoffice"-Statistic table page
...
...

Library         Browser
Resource        resources/resource.robot

*** Variables ***

*** Test Cases ***
Testing the table page content
    [Documentation]   testing the content of the data-men-table page
    GIVEN the user opens up   firefox
    AND opens the Homepage of dexterslab
    AND the title of the frontpage's browser-tab is   Homeoffice 2024
    WHEN the user clicks the button in the left corner
    AND clicks on the menu-link "Men in Homeoffice Data"
    THEN a page opens up with the headline   Men in Homeoffice Data
    AND the title of the tab is   Men in Homeoffice Data
    AND the page has a dropdown with selected number   50
    AND in the right corner the page contains a search bar
    AND the page contains a dark blue colored button with the text   Main Menu ☰
    AND the page contains another blue button with the text   Create Record
    AND the page contains a table with number of entries  4
    AND the table has number of columns     5 
    AND the first column has the title      Id
    AND the second column has the title     Aspekt
    AND the third column has the title      Value
    AND the fourth column contains an edit-button and a delete-button
    AND the the rows have certain text-entries