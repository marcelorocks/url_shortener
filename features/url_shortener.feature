Feature: Url Shortener

  @javascript
  Scenario: Successful url shortening
    Given I am on the home page
    When I fill in the url field with 'https://www.google.com'
    And I press 'Create'
    Then I should see 'Your short url is here' in the modal title
    When I follow the url
    Then I should be redirected to 'https://www.google.com'

  @javascript
  Scenario: Failed url shortening
    Given I am on the home page
    When I fill in the url field with 'okie-dokie'
    And I press 'Create'
    Then I should see 'Error' in the modal title
    And I should see '' in the modal error container
