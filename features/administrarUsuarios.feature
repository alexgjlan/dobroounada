Feature: Administrar usuários
        Para monitorar os usuários
        Como um administrador
        Eu quero visualizar seus perfis.
        
Scenario: Visualizar perfil do usuários
        Given I on the usuarios page
        When I click on "visu3"
        Then I should see "Dados do Usuário"