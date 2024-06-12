# ``Authentication``

Library that provides features used by GenericSwiftSDK's authentication libraries, as well as APIs used to work with tokens and user credentials. 

## Overview


You can use Authentication when you want to:

* Manage, store, and use tokens and user information.
* Introspect or monitor network activity, customize behavior, or other operations related to user interaction.

## Topics

### Essentials

- ``Credential``
- <doc:ManagingUserCredentials>

### Token Information

- ``Token``
- ``UserInfo``
- ``TokenInfo``

### JWT and Token Verification

- ``JWT``
- ``JWK``
- ``JWKS``
- ``JWTClaim``
- ``HasClaims``
- ``JSONClaimContainer``
- ``ClaimConvertable``
- ``IsClaim``
- ``Expires``

### Security

- ``Keychain``
- ``KeychainAuthenticationContext``
- ``TokenAuthenticationContext``

### Customizations

- <doc:CustomizingNetworkRequests>
- ``TimeCoordinator``
- ``CredentialCoordinator``
- ``CredentialDataSource``
- ``CredentialDataSourceDelegate``
- ``TokenStorage``
- ``TokenStorageDelegate``
- ``JWKValidator``
- ``TokenHashValidator``
- ``IDTokenValidator``
- ``IDTokenValidatorContext``

### Networking

- ``APIClient``
- ``APIClientDelegate``
- ``APIClientConfiguration``
- ``APIContentType``
- ``APIRequest``
- ``APIRequestBody``
- ``APIRequestArgument``
- ``APIRequestMethod``
- ``APIResponse``
- ``APIResponseResult``
- ``APIRateLimit``
- ``APIRetry``
- ``APIAuthorization``
- ``APIParsingContext``
- ``JSONDecodable``
- ``Empty``

### Error Types

- ``APIClientError``
- ``CredentialError``
- ``TokenError``
- ``JWTError``
- ``KeychainError``
- ``AuthenticationError``
- ``JSONValueError``

### Versioning

- ``SDKVersion``
- ``SDKVersionMigrator``
- ``Version``

### Internals and mocking

- ``DelegateCollection``
- ``UsesDelegateCollection``
- ``URLSessionProtocol``
- ``URLSessionDataTaskProtocol``
