*** Settings ***
Library  REST    http://0.0.0.0:8091
Documentation    Suite description

*** Test Cases ***
Test 01 read specific bear info
     ${bear_id}=  Provided precondition
     Get   /bear/${bear_id}
     Integer     response body bear_id   ${bear_id}
     String      response body bear_type  "BROWN"
     String      response body bear_name  "MIKE"
     Integer     response body bear_age    1

Test 27 delete specific bear
     ${bear_id}=  Provided precondition
     delete   /bear/${bear_id}
     Get   /bear/${bear_id}
     String  response body    "EMPTY"

*** Keywords ***
Provided precondition
   POST    /bear    ${json_create}
   ${bear_id}=  Output   response body
   [Return]   ${bear_id}

*** Variables ***
${json_create}    {"bear_type": "BROWN", "bear_name": "Mike", "bear_age": 1}
${json_update}    {"bear_type": "BLACK", "bear_name": "MONYA", "bear_age": 17}

