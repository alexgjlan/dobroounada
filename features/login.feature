Feature: Sign in the system
  In order to enter in the system
  As a user of the website
  I want to be able to login
  
  Scenario: Login HappyWay
    Given I am on the homepage
    When I log in with "ctccaio@hotmail.com" username and "123456" password
    Then I should see "Seja Bem-vindo"
    
  
  Scenario: Login SadWay UserIncorrect
    Given I am on the homepage
    When I log in with "vaidar@errado.com.br" username and "111" password
    Then I should see "Erro de acesso"
    
  Scenario: Login SadWay PasswordIncorrect
    Given I am on the homepage
    When I log in with "ctccaio@hotmail.com" username and "123" password
    Then I should see "Erro de acesso"
