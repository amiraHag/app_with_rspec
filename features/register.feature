Feature: Register
  
  Scenario: Unsuccessful register
    Given a user visits the register page
    When he submits invalid register information
    Then he should see a rgisteration error message
  
  Scenario: Successful register
    Given a user visits the register page
      When the user submits valid registeration information
      Then he should see a signout link