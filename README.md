# Dart DevApiService Plugin

This is a Dart plugin that allows you to interact with an API via HTTP requests. You can use it to login, retrieve data, add new records, edit, and delete data on a web page.

## Features

- **Authentication:** Login and manage user sessions.
- **Retrieve Data:** Perform GET requests to fetch information.
- **Add Data:** Send POST requests to add new records.
- **Edit Data:** Use PUT requests to update existing information.
- **Delete Data:** Perform DELETE requests to remove records.

## Installation

Add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  dev_api_service_plugin: ^1.0.0
```

## Usage

Import the plugin in your Dart file:

import 'package:your_plugin/your_plugin.dart';

## Authentication

final apiService = await DevApiService(email: 'email', password: 'password');

## Retrieve Data

final data = await apiService.get(project: "project", endpoint: "endpoint", authToken: "authToken");

## Add Data

final data = await apiService.post(project: "project", endpoint: "endpoint", authToken: "authToken", "id": id, "data": {"key": "value"});

## Edit Data

final data = await apiService.put(project: "project", endpoint: "endpoint", authToken: "authToken", "id": id, "data": {"key": "value"});

## Delete Data

final data = await apiService.delete(project: "project", endpoint: "endpoint", authToken: "authToken", "id": id);
