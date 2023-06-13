Feature: POST API | db.json

  Background: 
    * url 'http://localhost:3000'
    * header Accept = 'application/json'
    * def sendRequest = read('request.json')
    * def receiveResponse = read('response.json')

  #Test 1 - Create user as simple as possible
  Scenario: Create user
    Given url 'http://localhost:3000/users'
    And request {"firstName": "Alexis","lastName": "Servando","subjectId": 1}
    When method POST
    Then status 201
    And print response

  #Test 2 - Post with Background
  Scenario: Create user using Background
    Given path '/users'
    And request {"firstName": "Oliver","lastName": "Queen","subjectId": 2}
    When method POST
    Then status 201
    And print response

  #Test 3 - Post with Assertions - validate entire request versus single values
  Scenario: Create an user and assert the values
    Given path '/users'
    And request {"firstName": "Chisti","lastName": "Landaverde","subjectId": 1}
    When method POST
    Then status 201
    And print response
    And def user = response[0]
    And match response.firstName == 'Chisti'
    And match response.lastName == 'Landaverde'
    And match response.subjectId == 1

  #Test 4 - Post with assertions - validate entire request versus response
  Scenario: Create an user and assert the entire response
    Given path '/users'
    And request {"firstName": "Chisti","lastName": "Landaverde","subjectId": 1}
    When method POST
    Then status 201
    And print response
    And match response == {"firstName": "Chisti","lastName": "Landaverde","subjectId": 1, "id": '#ignore'}
    
    #Test 5 - Post using a Request file and a Response file declared in variables
    Scenario: Create an user using request and response files
    Given path '/users'
    And request sendRequest
    When method POST
    Then status 201
    And print response
    And match response == receiveResponse
