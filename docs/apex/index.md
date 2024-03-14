---
layout: default
---
# Classes
## Core

### [CoreLibs_AccountTeamMemberSelector](./Core/CoreLibs_AccountTeamMemberSelector.md)

Data access class for Account Team Members



### [CoreLibs_AsyncApexJobSelector](./Core/CoreLibs_AsyncApexJobSelector.md)

Data access layer for the AsyncApexJob object



### [CoreLibs_ClassMocker](./Core/CoreLibs_ClassMocker.md)

Class mocker class for mocking dependencies in apex



### [CoreLibs_CoreExceptions](./Core/CoreLibs_CoreExceptions.md)

Class for aggregating core exceptions



### [CoreLibs_CronTriggerSelector](./Core/CoreLibs_CronTriggerSelector.md)

Data access for the CronTrigger object



### [CoreLibs_Factories](./Core/CoreLibs_Factories.md)

Services class for exposing factories for generating CoreLibs objects



### [CoreLibs_FactoryMethodMock](./Core/CoreLibs_FactoryMethodMock.md)

Method mock for mocking classes returned from factories



### [CoreLibs_IMethodMock](./Core/CoreLibs_IMethodMock.md)

Base interface for mocking methods



### [CoreLibs_ReturnValueMethodMock](./Core/CoreLibs_ReturnValueMethodMock.md)

Method mock for simply returning values



### [CoreLibs_Services](./Core/CoreLibs_Services.md)

Services class for exposing stateless classes to clients



### [CoreLibs_TeamMemberService](./Core/CoreLibs_TeamMemberService.md)

Service layer for managing team members



### [CoreLibs_TestQueueable](./Core/CoreLibs_TestQueueable.md)

Basic test queuable that can be fed in to test certain functions



### [CoreLibs_ThrowExceptionMethodMock](./Core/CoreLibs_ThrowExceptionMethodMock.md)

Provided method mock for throwing exceptions



### [CoreLibs_Uuid](./Core/CoreLibs_Uuid.md)

Class encapsulating a UUID in Salesforce


## Miscellaneous

### [CoreLibs_ApexApiController](./Miscellaneous/CoreLibs_ApexApiController.md)

Aura controller for working with the apex api utility LWC



### [CoreLibs_CalloutException](./Miscellaneous/CoreLibs_CalloutException.md)

Exception that can be used/extended for callout functionality, particularly for
internal callouts that have standardized error codes



### [CoreLibs_ErrorCodeToUIMappingSelector](./Miscellaneous/CoreLibs_ErrorCodeToUIMappingSelector.md)

Data access class for the CoreLibs_ErrorCodeToUIMessageMapping__mdt object



### [CoreLibs_ErrorService](./Miscellaneous/CoreLibs_ErrorService.md)

Service class for functionality around errors



### [CoreLibs_IErrorCodeProvider](./Miscellaneous/CoreLibs_IErrorCodeProvider.md)

Base interface for any operation that may provide an error code



### [CoreLibs_TeamViewerController](./Miscellaneous/CoreLibs_TeamViewerController.md)

Controller for leverage with team viewer components


## Api

### [CoreLibs_ApiDispatcher](./Api/CoreLibs_ApiDispatcher.md)

Centralized dispatcher for managing api resolver logic



### [CoreLibs_ApiEndpointResolver](./Api/CoreLibs_ApiEndpointResolver.md)

Base resolver class for endpoints to implement. By default, methods will throw a method not supported exception.
Override only the methods which make sense for the endpoint



### [CoreLibs_ApiEndpointSelector](./Api/CoreLibs_ApiEndpointSelector.md)

Data selector class for Api_Endpoint__mdt custom metadata



### [CoreLibs_ApiErrorResponse](./Api/CoreLibs_ApiErrorResponse.md)

Simple API error response



### [CoreLibs_ApiExceptions](./Api/CoreLibs_ApiExceptions.md)

Exceptions to be used within the API framework for easy response/error handling



### [CoreLibs_ApiSuccessResponse](./Api/CoreLibs_ApiSuccessResponse.md)

Simple api success response



### [CoreLibs_HttpMethod](./Api/CoreLibs_HttpMethod.md)

Enum used indicated an http method



### [CoreLibs_HttpStatusCode](./Api/CoreLibs_HttpStatusCode.md)

Class used to manage and map the various HTTP codes that we support



### [CoreLibs_IApiResponse](./Api/CoreLibs_IApiResponse.md)

Base interface for responses to implement



### [CoreLibs_IdempotentApiResponse](./Api/CoreLibs_IdempotentApiResponse.md)

Data selector class for Api_Endpoint__mdt custom metadata



### [CoreLibs_IdempotentEntryCleanupJob](./Api/CoreLibs_IdempotentEntryCleanupJob.md)

Job for cleaning up API Requests after they have lived beyond some configurable TTL



### [CoreLibs_IdempotentEntrySelector](./Api/CoreLibs_IdempotentEntrySelector.md)

Data access class for idempotent keys


## API

### [CoreLibs_ApiUrlResolver](./API/CoreLibs_ApiUrlResolver.md)

Resolves a given Url to the appropriate API service resolver


## Async

### [CoreLibs_AsyncActionWithRetry](./Async/CoreLibs_AsyncActionWithRetry.md)

Wrapper queable which allows an async action to execute and retry under injected error
circumstances



### [CoreLibs_ExponentialBackoffRetry](./Async/CoreLibs_ExponentialBackoffRetry.md)

Expoenential backoff, capped at 5 retries due to CPU limitation concerns



### [CoreLibs_IAsyncAction](./Async/CoreLibs_IAsyncAction.md)

Refined async action interface that executes business logic. This can be repurposed in other areas
but is generally used within the AsyncActionWithBackoff class.



### [CoreLibs_IAsyncRetryStrategy](./Async/CoreLibs_IAsyncRetryStrategy.md)

Base interface for async retry strategies



### [CoreLibs_SchedulableQueueable](./Async/CoreLibs_SchedulableQueueable.md)

Wrapper for executing queueables in scheduled jobs



### [CoreLibs_StandardRetry](./Async/CoreLibs_StandardRetry.md)

Standard retry mechanism for static retry intervals


## Data

### [CoreLibs_BaseSelector](./Data/CoreLibs_BaseSelector.md)

Base CoreLibs_BaseSelector for query classes to implement which effectively combines
two aspects of data frameworks for cohesiveness and simplicity: the CoreLibs_BaseSelector and the query builder.
Respects security settings established in [CoreLibs_DataSettings](./Data/CoreLibs_DataSettings.md).



### [CoreLibs_DataExceptions](./Data/CoreLibs_DataExceptions.md)

Exceptions class for grouping data related exceptions



### [CoreLibs_DataSettings](./Data/CoreLibs_DataSettings.md)

Settings singleton for data interactions



### [CoreLibs_DataStringAdapter](./Data/CoreLibs_DataStringAdapter.md)

Adapter for providing consistent way of mapping strings and enums



### [CoreLibs_DatabaseConnection](./Data/CoreLibs_DatabaseConnection.md)

Primary database connection class for apex operations. See [CoreLibs_IDatabaseConnection](./Data/CoreLibs_IDatabaseConnection.md)



### [CoreLibs_DatabaseOperation](./Data/CoreLibs_DatabaseOperation.md)

Enume for capturng database operations, inclusive of those not covered
by system libs



### [CoreLibs_Dml](./Data/CoreLibs_Dml.md)

Dml service class for implementing flexible, secure-by-default conn write operations
Should be used in place of standard DML and/or Database operations



### [CoreLibs_IDatabaseConnection](./Data/CoreLibs_IDatabaseConnection.md)

Base interface for db connections



### [CoreLibs_MockDatabaseConnection](./Data/CoreLibs_MockDatabaseConnection.md)

Mocked db that can be used to replace the standard testing db for most applications,
affording further decoupling from other parts of the system



### [CoreLibs_SObjectInspector](./Data/CoreLibs_SObjectInspector.md)

Reflection class for inspecting an SObject



### [CoreLibs_SObjectInspectorFactory](./Data/CoreLibs_SObjectInspectorFactory.md)

Factory for producing SObject inspectors -- should be invoked from the CoreLibs_Factories class
in order to support mocking



### [CoreLibs_SObjectMocker](./Data/CoreLibs_SObjectMocker.md)

Mocking utility for generating mock and test data



### [CoreLibs_SelectorFactory](./Data/CoreLibs_SelectorFactory.md)

Factory class for producing selectors to allow decoupling of construction
and utilization



### [CoreLibs_SmartDataFactory](./Data/CoreLibs_SmartDataFactory.md)

Flexible data factory for generating data with required fields generated with some reasonable value


## Logging

### [CoreLibs_CreateErrorLog](./Logging/CoreLibs_CreateErrorLog.md)

Invocable action for creating error logs



### [CoreLibs_CreateInfoLog](./Logging/CoreLibs_CreateInfoLog.md)

Invocable action for creating info logs



### [CoreLibs_CreateWarnLog](./Logging/CoreLibs_CreateWarnLog.md)

Invocable action for creating error logs



### [CoreLibs_LightningLogger](./Logging/CoreLibs_LightningLogger.md)

Logging class for exposure to Aura/LWC components



### [CoreLibs_LogCleanupJob](./Logging/CoreLibs_LogCleanupJob.md)

Cleanup jobs for logs in Salesforce



### [CoreLibs_LogController](./Logging/CoreLibs_LogController.md)

Lightning controller for various log UI functionality



### [CoreLibs_LogSelector](./Logging/CoreLibs_LogSelector.md)

Data access class for the CoreLibs_Log__c SObject



### [CoreLibs_Logger](./Logging/CoreLibs_Logger.md)

Logging interface for creating Salesforce logs



### [CoreLibs_LoggerContext](./Logging/CoreLibs_LoggerContext.md)

Context singleton class used by logging functionality around logging events



### [CoreLibs_MonitoringRuleProcessor](./Logging/CoreLibs_MonitoringRuleProcessor.md)

Base class for monitoring rule processesors. Note that when creating new
processor types, there may be additional configuration in the ClassName__c field on
the CoreLibs_MonitoringRule__c object



### [CoreLibs_MonitoringRuleSelector](./Logging/CoreLibs_MonitoringRuleSelector.md)

Data access layer ofr Salesforce monitoring rules



### [CoreLibs_QueryRuleProcessor](./Logging/CoreLibs_QueryRuleProcessor.md)

Rule for using queries to trigger alerts



### [CoreLibs_SalesforceMonitor](./Logging/CoreLibs_SalesforceMonitor.md)

Runs the Salesforce monitor job which will process monitoring rules sequentially


## Email

### [CoreLibs_DevTeamEmail](./Email/CoreLibs_DevTeamEmail.md)

Service class for managing emails to the dev team



### [CoreLibs_Email](./Email/CoreLibs_Email.md)

Static accessor for various email related functions


## Env

### [CoreLibs_EnvController](./Env/CoreLibs_EnvController.md)

Aura controller for environment related functions



### [CoreLibs_EnvExceptions](./Env/CoreLibs_EnvExceptions.md)

Exceptions class for environment utilities



### [CoreLibs_Environment](./Env/CoreLibs_Environment.md)

Envirnment singleton used for various environment related functionas



### [CoreLibs_GetFeatureFlagValue](./Env/CoreLibs_GetFeatureFlagValue.md)

Invocable action for retrieving feature flag settings in flows



### [CoreLibs_ObjectInspector](./Env/CoreLibs_ObjectInspector.md)

Reflection class for objects in Apex


## Callouts

### [CoreLibs_HttpClient](./Callouts/CoreLibs_HttpClient.md)

Custom http client for executing callouts



### [CoreLibs_ICallout](./Callouts/CoreLibs_ICallout.md)

Base interface for any external callouts. This is used with the CoreLibs_HttpClient
rather than building req/res handling on every callout. Currently only supports string bodies, will
extend later for blob bodies if necessary


