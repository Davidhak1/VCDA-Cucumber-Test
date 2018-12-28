Feature: Price Controller Test

  Background:
    Given Initialization
    And the server endpoint is https://price-qa.inv-np.dealer.com


  @Rest_Assured
  @Controller_5.1
  Scenario: Endpoint vehicles/price  - Validating response
    When adding api path for get request /vehicles/price
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    When adding following parameters
      | uuid                | e8b798e70a0a000201fa7440aa022025 |
      | type                | DPRICE                           |
      | associatedAccountId | carlgregorycdjcolumbuscllc       |
    And perform the get request
    Then the response code should be 200
    Then I should see json response with the array of equal than 1 items on the filtered content node
    Then I should see json response with pairs on the filtered content node
      | uuid  | e8b798e70a0a000201fa7440aa022025 |
      | price | 33392                            |


  @Rest_Assured
  @Controller_5.2
  Scenario: Endpoint vehicles/price - with multiple uuid's - Validating response
    When adding api path for get request /vehicles/price
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    When adding following parameters
      | uuid                | 71522ec80a0e0a6b309c91c087204cad |
      | uuid                | e8b798e70a0a000201fa7440aa022025 |
      | type                | DPRICE                           |
      | associatedAccountId | carlgregorycdjcolumbuscllc       |
    And perform the get request
    Then the response code should be 200
    Then I should see json response with the array of equal than 2 items on the filtered content node



  @Rest_Assured
  @Controller_5.3
  Scenario: Negative (not sending required param. - accountId) Endpoint vehicles/price  - Validating response
    When adding api path for get request /vehicles/price
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    When adding following parameters
      | uuid | e8b798e70a0a000201fa7440aa022025 |
      | type | DPRICE                           |
    And perform the get request
    Then the response code should be 400


  @Rest_Assured
  @Controller_5.4
  Scenario: Negative (wrong uuid) Endpoint vehicles/price  - Validating response
    When adding api path for get request /vehicles/price
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    When adding following parameters
      | uuid                | e8b798e70a0a000201fa7440aa022123 |
      | type                | DPRICE                           |
      | associatedAccountId | carlgregorycdjcolumbuscllc       |
    And perform the get request
    Then the response code should be 204


  @Rest_Assured
  @Controller_5.5
  Scenario Outline: Negative (wrong auth) Endpoint vehicles/price  - Validating response
    When adding api path for get request /vehicles/price
    When adding basic authentication <username> <password>
    When adding following parameters
      | uuid                | e8b798e70a0a000201fa7440aa022025 |
      | type                | DPRICE                           |
      | associatedAccountId | carlgregorycdjcolumbuscllc       |
    And perform the get request
    Then the response code should be 401
    Examples:
      | username | password              |
      | vcda     | wrong                 |
      | wrong    | WhatAPr0j3ctPassw0rd! |
      | wrong    | wrong                 |
