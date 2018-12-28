Feature: Equipment Controller Test

  Background:
    Given Initialization
    And the server endpoint is https://equipment-qa.inv-np.dealer.com

#----------Positives----------


  @Rest_Assured
  @Controller_6.1
  Scenario: Endpoint vehicles/equipment  - Validating response
    When adding api path for get request /vehicles/equipment
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    When adding following parameters
      | uuid | e8b798e70a0a000201fa7440aa022025 |
    And perform the get request
    Then the response code should be 200
    Then I should see json response with the array of greater than 3 items on the filtered content[0].equipment.en_US.specCats node
    Then I should see json response with pairs on the filtered content node
      | vehicleUUID | e8b798e70a0a000201fa7440aa022025 |

  @Rest_Assured
  @Controller_6.2
  Scenario: Endpoint vehicles/equipment/id/{uuid}  - Validating response
    When adding api path for get request /vehicles/equipment/id
    When adding api path for get request /e8b798e70a0a000201fa7440aa022025
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    And perform the get request
    Then the response code should be 200
    Then I should see json response with the array of greater than 3 items on the filtered equipment.en_US.specCats node
    Then I should see json response with pairs on the filtered $ node
      | vehicleUUID | e8b798e70a0a000201fa7440aa022025 |


#----------Negatives----------

  @Rest_Assured
  @Controller_6.3
  Scenario: Negative (wrong uuid) Endpoint vehicles/equipment  - Validating response
    When adding api path for get request /vehicles/equipment
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    When adding following parameters
      | uuid | e8b798e70a0a000201fa7440aa022123 |
    And perform the get request
    Then the response code should be 204


  @Rest_Assured
  @Controller_6.4
  Scenario Outline: Negative (wrong auth) Endpoint vehicles/equipment  - Validating response
    When adding api path for get request /vehicles/equipment
    When adding basic authentication <username> <password>
    When adding following parameters
      | uuid | e8b798e70a0a000201fa7440aa022025 |
    And perform the get request
    Then the response code should be 401
    Examples:
      | username | password              |
      | vcda     | wrong                 |
      | wrong    | WhatAPr0j3ctPassw0rd! |


  @Rest_Assured
  @Controller_6.5
  Scenario: Negative (wrong uuid) Endpoint vehicles/equipment/id/{uuid}  - Validating response
    When adding api path for get request /vehicles/equipment/id
    When adding api path for get request /e8b798e70a0a000201fa7440aa022123
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    And perform the get request
    Then the response code should be 404


  @Rest_Assured
  @Controller_6.6
  Scenario Outline: Negative (wrong auth) Endpoint vehicles/equipment/id/{uuid}  - Validating response
    When adding api path for get request /vehicles/equipment/id
    When adding api path for get request /e8b798e70a0a000201fa7440aa022025
    When adding basic authentication <username> <password>
    And perform the get request
    Then the response code should be 401
    Examples:
      | username | password              |
      | vcda     | wrong                 |
      | wrong    | WhatAPr0j3ctPassw0rd! |