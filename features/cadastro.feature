Feature: Sign up for DobroOuNada
  In order to create an account
  As a user of the website
  I want to create an account
  
Scenario: Sign up HappyWay
    Given I am on the sign up page
    When I sign up with "Algum nome" as name, "abc@hotmail.com" as e-mail and "123" for password
    Then I should see "Seja Bem-vindo"
    
Scenario: Sign up SadWay invalid email
    Given I am on the sign up page
    When I sign up with "Algum nome" as name, "abcom" as e-mail and "123" for password
    Then I should see "Email is invalid"
    
Scenario: Sign up SadWay blank email
    Given I am on the sign up page
    When I sign up with "Algum nome" as name, "" as e-mail and "123" for password
    Then I should see "Email can't be blank"
    
Scenario: Sign up SadWay blank name
    Given I am on the sign up page
    When I sign up with "" as name, "ab@hotmail.com" as e-mail and "123" for password
    Then I should see "Name can't be blank"
    
Scenario: Sign up SadWay blank password
    Given I am on the sign up page
    When I sign up with "" as name, "ab@hotmail.com" as e-mail and "" for password
    Then I should see "Access token can't be blank"