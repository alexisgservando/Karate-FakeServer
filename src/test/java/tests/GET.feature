Feature: GET API | db.json

  Background: 
    * url 'http://localhost:3000'

  #Test 1 - Get all the users
  Scenario: Get the list of users
    Given url 'http://localhost:3000/users'
    When method GET
    Then status 200
    And print response

  #Test 2 - Get all the users using the variable defined in the Background
  Scenario: Get all the users
    Given path '/users/'
    When method GET
    Then status 200
    And print response

  #Test 3 - Get a specific user using the param id = 5
  Scenario: Get 1 user with param
    Given path '/users'
    And param id = 5
    When method GET
    Then status 200
    And print response

  #Test 4 - Get a specific user by using the path (same as previous test but a different method)
  Scenario: Get 1 user with path
    Given path '/users/5'
    When method GET
    Then status 200
    And print response

  #Test 5 - Get all the users but assert the elements in the last user
  Scenario: Get all users and assert
    Given path '/users'
    When method GET
    Then status 200
    And print response
    And match karate.sizeOf(response) == 5
    And match response[4].firstName == 'Fer'
    And match response[4].lastName == 'Guardado'
    And match response[4].subjectId == 2
    And match response[4].id == 5

  #Test 6 - Get the last user and assert the elements and values
  Scenario: Get the last user and assert
    Given path '/users'
    And param id = 5
    When method GET
    Then status 200
    And print response
    And def user = response[0]
    And match user.firstName == 'Fer'
    And match user.lastName == 'Guardado'
    And match user.subjectId == 2
    And match user.id == 5
    
    #Test 7 - Get the users enrolled in subject 2 
    Scenario: Get all the users enrolled in subject 2 
    Given path '/subjects/2/users'
    When method GET 
    Then status 200 
    And print response
    And def user = response[2]
    And match user.firstName == 'Fer'
    And match user.lastName == 'Guardado'
    And match user.subjectId == 2
    And match user.id == 5
