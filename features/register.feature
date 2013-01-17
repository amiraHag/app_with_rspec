Feature: Register
  
  Scenario: Unsuccessful register
    Given a user visits the register page
    When he submits invalid register information
    Then he should see an error message
  
  Scenario: Successful register
    Given a user visits the register page
      When he submits valid register information
      Then he shouldn't see an error message