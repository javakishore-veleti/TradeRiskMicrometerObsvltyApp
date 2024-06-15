# TradeRiskMicrometerObsvltyApp

This project is a Maven multi-module setup for a TradeRisk application, utilizing Spring Boot and Micrometer for observability. It includes two independent Spring Boot web applications:

1. **trade-manager-service**: Manages trade details and provides trade information through RESTful APIs.
2. **trade-risk-service**: Consumes trade information from the trade-manager-service, applies risk rules, and returns risk evaluation results.

## Key Features

- **Micrometer Integration**: The primary focus of this project is to leverage Micrometer for comprehensive observability. Metrics from both services are collected and published for monitoring and analysis.
- **Elastic Stack**: Observability information is published to Elasticsearch, allowing for powerful search, analysis, and visualization using Kibana.
- **Conditional AWS CloudWatch Integration**: Metrics can also be conditionally published to AWS CloudWatch based on a feature toggle, providing flexibility in monitoring and alerting within AWS environments.

This setup enables detailed monitoring and insights into the application's performance and behavior, helping ensure reliability and operational efficiency.

## Project Structure
TradeRiskMicrometerObsvltyApp
│
├── pom.xml
├── trade-manager-service
│ ├── pom.xml
│ └── src/main/java/org/tmh/platform/monitoring/trades/trade_manager_service/...
│
└── trade-risk-service
├── pom.xml
└── src/main/java/org/tmh/platform/monitoring/trades/trade_risk_service/...


## Modules

### trade-manager-service

- **Description**: Manages trade details and provides trade information through RESTful APIs.
- **Technologies**: Spring Boot, Micrometer, Elasticsearch, AWS CloudWatch

### trade-risk-service

- **Description**: Consumes trade information from the trade-manager-service, applies risk rules, and returns risk evaluation results.
- **Technologies**: Spring Boot, Micrometer, Elasticsearch, AWS CloudWatch

## Getting Started

### Prerequisites

- Java 11 or later
- Maven 3.6.3 or later
- Elasticsearch
- AWS account (for CloudWatch integration)

### Building the Project

To build the project, navigate to the root directory (`TradeRiskMicrometerObsvltyApp`) and run:

```sh
mvn clean install
```

### Running the Applications

#### trade-manager-service
Navigate to the trade-manager-service directory and run:

```sh
mvn spring-boot:run
```
#### trade-risk-service
Navigate to the trade-risk-service directory and run:

```sh
mvn spring-boot:run
```

### Configuration
#### Micrometer and Observability
1. Elasticsearch: Configure the connection to your Elasticsearch instance in application.properties.
2. AWS CloudWatch: Enable or disable AWS CloudWatch integration using a feature toggle in application.properties.
