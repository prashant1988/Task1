Feature: Employee
  In order to make a employee detail
  As a user
  I want to create and manage employee

# Scenario: Employee_list
#   Given I have employee_lists column Email_id, Department
#   When I go to list of employee
#   Then I should see "Email_id"
#   And  I should see "Department"

  Background:
     Given I am logged in

#    Scenario: User is not signed up
#      Given  I do not exist as a user
#      When I sign in with valid credentials
#      Then I see an invalid login message
#      And  I should be signed out
#
#    Scenario: User signs in successfully
#      Given I exist as a user
#      And   I am not logged in
#      When I sign in with valid credentials
#      Then I see a successful sign in message
#      When I return to the site
#      Then I should be signed in
#      And I should see "Lists"

  Scenario: Create valid Employee
    Given I have no employees
    And I am on  Lists
    When I follow "Enter new details"
    And I fill in "employee_email_id" with "ram@yahoo.com"
    And I fill in "autocomplete1" with "Tester"
    And I press "Create"
    Then I should see "new data created"
    And I should see "ram@yahoo.com"
    And I should see "Tester"
    And I should have 1 articles