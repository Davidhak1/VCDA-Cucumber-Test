Feature: incentives Controller Test

  Background:
    Given Initialization
    And the server endpoint is https://incentives-qa.inv-np.dealer.com

#----------Positives----------


  @Rest_Assured
  @Controller_7.1
  Scenario: Endpoint /incentives  - Validating response
    When adding api path for get request /incentives
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    And perform the get request
    Then the response code should be 200


  @Rest_Assured
  @Controller_7.2
  Scenario: Endpoint /incentives  - Validating response with uniqueId
    When adding api path for get request /incentives
    When adding following parameters
      | uniqueId | dowautoplexchevy_916b735a0a2503f52c81a081a1e06f6b |
      | select   | applicableModel                                   |
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    And perform the get request
    Then the response code should be 200
    Then I should see json response with pairs on the filtered content node
      | uniqueId    | dowautoplexchevy_916b735a0a2503f52c81a081a1e06f6b |
      | incentiveId | 916b735a0a2503f52c81a081a1e06f6b                  |


  @Rest_Assured
  @Controller_7.3
  Scenario: Endpoint /incentives  - Validating response with incentiveId
    When adding api path for get request /incentives
    When adding following parameters
      | incentiveId | 916b735a0a2503f52c81a081a1e06f6b |
      | select      | applicableModel                  |
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    And perform the get request
    Then the response code should be 200
    Then I should see json response with the array of greater than 10 items on the filtered content node
    Then I should see json response with pairs on the filtered content node
      | incentiveId | 916b735a0a2503f52c81a081a1e06f6b |


  @Rest_Assured
  @Controller_7.4
  Scenario: Endpoint /incentives/id/{uniqueId}  - Validating response with uniqueId
    When adding api path for get request /incentives/id
    When adding api path for get request /dowautoplexchevy_916b735a0a2503f52c81a081a1e06f6b
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    And perform the get request
    Then the response code should be 200
    Then I should see json response with pairs on the filtered $ node
      | uniqueId    | dowautoplexchevy_916b735a0a2503f52c81a081a1e06f6b |
      | incentiveId | 916b735a0a2503f52c81a081a1e06f6b                  |







#----------Negatives----------

  @Rest_Assured
  @Controller_7.6
  Scenario: Negative(with wrong uniqueId) Endpoint /incentives  - Validating response
    When adding api path for get request /incentives
    When adding following parameters
      | uniqueId | dowautoplexchevy_916b735a0a2503f52c81a081a1e06123 |
      | select   | applicableModel                                   |
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    And perform the get request
    Then the response code should be 204


  @Rest_Assured
  @Controller_7.7
  Scenario: Negative (with wrong incentiveId) Endpoint /incentives  - Validating response
    When adding api path for get request /incentives
    When adding following parameters
      | incentiveId | 916b735a0a2503f52c81a081a1e06f123 |
      | select      | applicableModel                  |
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    And perform the get request
    Then the response code should be 204


  @Rest_Assured
  @Controller_7.8
  Scenario: Negative(wrong uniqueId) Endpoint /incentives/id/{uniqueId}  - Validating response
    When adding api path for get request /incentives/id
    When adding api path for get request /dowautoplexchevy_916b735a0a2503f52c81a081a1e06f123
    When adding basic authentication vcda WhatAPr0j3ctPassw0rd!
    And perform the get request
    Then the response code should be 404

  @Rest_Assured
  @Controller_7.9.1
  Scenario Outline: Negative (wrong auth) Endpoint /incentives  - Validating response
    When adding api path for get request /incentives
    When adding basic authentication <username> <password>
    And perform the get request
    Then the response code should be 401
    Examples:
      | username | password              |
      | wrong    | WhatAPr0j3ctPassw0rd! |
      | vcda     | wrong                 |


  @Rest_Assured
  @Controller_7.9.2
  Scenario Outline: Negative (wrong auth) Endpoint /incentives/id/{uniqueId} - Validating response
    When adding api path for get request /incentives/id
    When adding api path for get request /dowautoplexchevy_916b735a0a2503f52c81a081a1e06f6b
    When adding basic authentication <username> <password>
    And perform the get request
    Then the response code should be 401
    Examples:
      | username | password              |
      | wrong    | WhatAPr0j3ctPassw0rd! |
      | vcda     | wrong                 |
