
# ``Documentation for `GenericAPILogHandler` and `Logger` Extensions``

## Overview

`GenericAPILogHandler` is a custom log handler designed to integrate with Apple's `swift-log` system. This log handler prints log messages to the console and supports configurable log levels and metadata.

## `GenericAPILogHandler`

This struct conforms to the `LogHandler` protocol from the `swift-log` package, providing a concrete implementation for logging.

### Properties

- **label**: A string identifier for the logger, typically indicating the subsystem or component responsible for the logs.
- **logLevel**: The severity level for the logs (e.g., `.debug`, `.info`, `.warning`, `.error`).
- **metadata**: A dictionary containing additional context information for the logs.

### Initializers

- **`init(label:logLevel:metadata:)`**
  - **label**: A label for the logger.
  - **logLevel**: The log level for the logger.
  - **metadata**: Optional metadata for the logger. Default is an empty dictionary.

### Methods

- **`bootstrap()`**
  - Configures `GenericAPILogHandler` as the logging backend using `LoggingSystem.bootstrap(_:)`.
  - Ensures this method is called only once, even if invoked multiple times.
  - Thread-safe, using a dispatch queue to synchronize initialization.
  
  **Example:**
  ```swift
  GenericAPILogHandler.bootstrap()


