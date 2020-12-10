Feature: Test with login function of 
Test login function with valid account and invalid accounts
   Scenario:  Login with valid account
      Given Brow to login pages 
      When Login with valid user "tomsmith" and  valid password "SuperSecretPassword!"
      Then Login successful
      
   Scenario Outline: Login with invalid account
      Given Brow to login pages
      When Login with invalid user "<username>" and  valid password "<password>"
      Then  Notification content "<invalidaccount>" is showed

      Examples: 
      |username   |password   |invalidaccount                     |
      |kenkaku    |12345      |Your username is invalid!\n×       |
      |tomsmith   |kenkaku    |Your password is invalid!\n×       |
