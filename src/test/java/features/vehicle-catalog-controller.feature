Feature: Vehicle (V2) Controller Test

  Background:
    Given Initialization
    And the server endpoint is https://vehicles-qa.inv-np.dealer.com


  @Rest_Assured
  @Controller_3.1
  Scenario: Endpoints vehicles/catalog/categories  - Validating response
    When adding api path for get request /vehicles/catalog/categories
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    And perform the get request
    Then the response code should be 200
    Then I should see json response as an array containing following elements
      | ATV            |
      | AUTO           |
      | BOAT           |
      | FARMEQUIPMENT  |
      | HEAVYEQUIPMENT |
      | HEAVYTRUCK     |
      | MOTORCYCLE     |
      | PWC            |
      | REALESTATE_CA  |
      | RV             |
      | SNOWMOBILE     |
      | TRAILER        |
      | UNKNOWN        |


  @Rest_Assured
  @Controller_3.2
  Scenario: Endpoints vehicles/catalog/classifications  - Validating response
    When adding api path for get request /vehicles/catalog/classifications
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    And perform the get request
    Then the response code should be 200
    Then I should see json response as an array containing following elements
      | PRIMARY     |
      | FLEET       |
      | EXOTIC      |
      | WHOLESALE   |
      | CLASSIFIEDS |
      | UNKNOWN     |


  @Rest_Assured
  @Controller_3.3
  Scenario: Endpoints vehicles/catalog/statuses  - Validating response
    When adding api path for get request /vehicles/catalog/statuses
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    And perform the get request
    Then the response code should be 200
    Then I should see json response as an array containing following elements
      | LIVE                  |
      | STAGING               |
      | SOLD                  |
      | IN_TRANSIT            |
      | REJECTED              |
      | ON_DEPOSIT            |
      | IN_TRANSIT_AT_PORT    |
      | IN_TRANSIT_SOLD       |
      | IN_TRANSIT_AT_FACTORY |
      | UNKNOWN               |


  @Rest_Assured
  @Controller_3.4
  Scenario: Endpoints vehicles/catalog/types  - Validating response
    When adding api path for get request /vehicles/catalog/types
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    And perform the get request
    Then the response code should be 200
    Then I should see json response as an array containing following elements
      | NEW     |
      | USED    |
      | UNKNOWN |


  @Rest_Assured
  @Controller_3.5
  Scenario Outline: Endpoints all - negative wrong username and or password
    When adding api path for get request /vehicles/catalog
    When adding api path for get request <endpoint>
    When adding basic authentication <username> <password>
    And perform the get request
    Then the response code should be 401
    Examples:
      | endpoint        | username | password              |
      | /categories     | wrong    | WhatAPr0j3ctPassw0rd! |
      | /categories     | vcda     | wrong                 |
      | /categories     | wrong    | wrong                 |
      | /classification | wrong    | WhatAPr0j3ctPassw0rd! |
      | /classification | vcda     | wrong                 |
      | /classification | wrong    | wrong                 |
      | /statuses       | wrong    | WhatAPr0j3ctPassw0rd! |
      | /statuses       | vcda     | wrong                 |
      | /statuses       | wrong    | wrong                 |
      | /types          | wrong    | WhatAPr0j3ctPassw0rd! |
      | /types          | vcda     | wrong                 |
      | /types          | wrong    | wrong                 |