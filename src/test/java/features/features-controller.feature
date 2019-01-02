Feature: Equipment Controller Test

  Background:
    Given Initialization
    And the server endpoint is https://features-qa.inv-np.dealer.com

#----------Positives----------


  @Rest_Assured
  @Controller_8.1
  Scenario: Endpoint vehicles/features  - Validating response with only 'uuid' param
    When adding api path for get request /vehicles/features
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    When adding following parameters
      | uuid | e8b798e70a0a000201fa7440aa022025 |
    And perform the get request
    Then the response code should be 200
    Then I should see json response with pairs on the filtered content node
      | uuid | e8b798e70a0a000201fa7440aa022025 |


  @Rest_Assured
  @Controller_8.2
  Scenario: Endpoint vehicles/features  - Validating response with 'package' param
    When adding api path for get request /vehicles/features
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    When adding following parameters
      | uuid   | e8b798e70a0a000201fa7440aa022025 |
      | select | packages                         |
    And perform the get request
    Then the response code should be 200
    Then I should see json response with pairs on the filtered content node
      | uuid | e8b798e70a0a000201fa7440aa022025 |


  @Rest_Assured
  @Controller_8.3
  Scenario: Endpoint vehicles/features  - Validating response with 'standard' param
    When adding api path for get request /vehicles/features
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    When adding following parameters
      | uuid   | e8b798e70a0a000201fa7440aa022025 |
      | select | standard                         |
    And perform the get request
    Then the response code should be 200
    Then I should see json response with pairs on the filtered content node
      | uuid | e8b798e70a0a000201fa7440aa022025 |
    Then I should see the specifc json value for the following jsonPath
      | content[0].standard._type | sf |