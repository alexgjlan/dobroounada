Given(/^I on the usuarios page$/) do
  visit "https://dobro-ou-nada-giovanileite.c9users.io/usuarios"
end

When(/^I click on "([^"]*)"$/) do |id_visualizar|
  click_on id_visualizar
end

When(/^I uncheck "([^"]*)"$/) do |checkbox|
  uncheck checkbox
end

When(/^I check "([^"]*)"$/) do |checkbox|
  check checkbox
end