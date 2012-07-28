
 Feature: Sign out
   In order to protect my account from unauthorized access
   As a signed in user
   Should be able to sign out

     Scenario: User Signs out
       Given I am logged in
       When I sign out
       Then   I should be signed out