Feature: PUT API | db.json

  Background: 
    * url 'http://localhost:3000'
    * header Accept = 'application/json'

  #Test 1 - Update an user with values taken from the request.json
  Scenario: Update an user with values taken from the request.json
    Given path '/users/1'
    And request {"firstName": "Floor","lastName": "Jansen", "subjectId": 2, "id": 1}
    When method PUT
    Then status 200
    And print response
    And match response == {"firstName": "Floor","lastName": "Jansen", "subjectId": 2, "id":1}