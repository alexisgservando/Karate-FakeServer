Feature: Delete API | db.json

  Background: 
    * url 'http://localhost:3000'

  #Test 1 - Delete a specific user by using the path
  Scenario: Delete user by using path
    Given path '/users/7'
    When method DELETE
    Then status 200
