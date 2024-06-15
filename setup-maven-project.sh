#!/bin/bash

# Create parent directory
mkdir -p TradeRiskMicrometerObsvltyApp
cd TradeRiskMicrometerObsvltyApp || exit

# Create parent POM
cat <<EOL > pom.xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>org.tmh.platform.monitoring.trades</groupId>
    <artifactId>trade-risk-micrometer-obsvlty-app</artifactId>
    <version>1.0.0</version>
    <packaging>pom</packaging>

    <modules>
        <module>trade-manager-service</module>
        <module>trade-risk-service</module>
    </modules>

    <dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-dependencies</artifactId>
                <version>2.7.5</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
        </dependencies>
    </dependencyManagement>

    <build>
        <pluginManagement>
            <plugins>
                <plugin>
                    <groupId>org.springframework.boot</groupId>
                    <artifactId>spring-boot-maven-plugin</artifactId>
                </plugin>
            </plugins>
        </pluginManagement>
    </build>
</project>
EOL

# Create trade-manager-service module
mkdir -p trade-manager-service/src/main/java/org/tmh/platform/monitoring/trades/trade_manager_service/{api/controllers,common/{constants,models,utils},services/{impl,interfaces}}
mkdir -p trade-manager-service/src/main/resources

# Create trade-manager-service POM
cat <<EOL > trade-manager-service/pom.xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.tmh.platform.monitoring.trades</groupId>
        <artifactId>trade-risk-micrometer-obsvlty-app</artifactId>
        <version>1.0.0</version>
    </parent>
    <artifactId>trade-manager-service</artifactId>
    <groupId>org.tmh.platform.monitoring.trades</groupId>
    <version>1.0.0</version>
    <packaging>jar</packaging>

    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-actuator</artifactId>
        </dependency>
        <dependency>
            <groupId>io.micrometer</groupId>
            <artifactId>micrometer-registry-elastic</artifactId>
            <version>1.10.5</version>
        </dependency>
        <dependency>
            <groupId>io.micrometer</groupId>
            <artifactId>micrometer-registry-cloudwatch</artifactId>
            <version>1.10.5</version>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>
</project>
EOL

# Create TradeManagerServiceApplication.java
cat <<EOL > trade-manager-service/src/main/java/org/tmh/platform/monitoring/trades/trade_manager_service/TradeManagerServiceApplication.java
package org.tmh.platform.monitoring.trades.trade_manager_service;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class TradeManagerServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(TradeManagerServiceApplication.class, args);
    }
}
EOL

# Create TradeController.java
cat <<EOL > trade-manager-service/src/main/java/org/tmh/platform/monitoring/trades/trade_manager_service/api/controllers/TradeController.java
package org.tmh.platform.monitoring.trades.trade_manager_service.api.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TradeController {

    @GetMapping("/api/trades/{tradeId}")
    public String getTradeDetails(@PathVariable String tradeId) {
        // Mock implementation, replace with actual logic
        return "Trade details for trade ID: " + tradeId;
    }
}
EOL

# Create trade-risk-service module
mkdir -p trade-risk-service/src/main/java/org/tmh/platform/monitoring/trades/trade_risk_service/{api/controllers,common/{constants,models,utils},services/{impl,interfaces}}
mkdir -p trade-risk-service/src/main/resources

# Create trade-risk-service POM
cat <<EOL > trade-risk-service/pom.xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.tmh.platform.monitoring.trades</groupId>
        <artifactId>trade-risk-micrometer-obsvlty-app</artifactId>
        <version>1.0.0</version>
    </parent>
    <artifactId>trade-risk-service</artifactId>
    <groupId>org.tmh.platform.monitoring.trades</groupId>
    <version>1.0.0</version>
    <packaging>jar</packaging>

    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-actuator</artifactId>
        </dependency>
        <dependency>
            <groupId>io.micrometer</groupId>
            <artifactId>micrometer-registry-elastic</artifactId>
            <version>1.10.5</version>
        </dependency>
        <dependency>
            <groupId>io.micrometer</groupId>
            <artifactId>micrometer-registry-cloudwatch</artifactId>
            <version>1.10.5</version>
        </dependency>
        <dependency>
            <groupId>org.tmh.platform.monitoring.trades</groupId>
            <artifactId>trade-manager-service</artifactId>
            <version>1.0.0</version>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>
</project>
EOL

# Create TradeRiskServiceApplication.java
cat <<EOL > trade-risk-service/src/main/java/org/tmh/platform/monitoring/trades/trade_risk_service/TradeRiskServiceApplication.java
package org.tmh.platform.monitoring.trades.trade_risk_service;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class TradeRiskServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(TradeRiskServiceApplication.class, args);
    }
}
EOL

# Create TradeRiskController.java
cat <<EOL > trade-risk-service/src/main/java/org/tmh/platform/monitoring/trades/trade_risk_service/api/controllers/TradeRiskController.java
package org.tmh.platform.monitoring.trades.trade_risk_service.api.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class TradeRiskController {

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/api/traderisk/{tradeId}")
    public String getTradeRisk(@PathVariable String tradeId) {
        String tradeDetails = restTemplate.getForObject("http://localhost:8080/api/trades/" + tradeId, String.class);
        // Mock implementation, replace with actual risk evaluation logic
        return "Risk evaluation for " + tradeDetails;
    }
}
EOL

# Create npm package.json
cat <<EOL > package.json
{
  "name": "TradeRiskMicrometerObsvltyApp",
  "version": "1.0.0",
  "description": "Maven multi-module project for TradeRisk application with Spring Boot, Micrometer, Elasticsearch, and AWS CloudWatch.",
  "scripts": {
    "build": "mvn clean install",
    "start:trade-manager-service": "cd trade-manager-service && mvn spring-boot:run",
    "start:trade-risk-service": "cd trade-risk-service && mvn spring-boot:run",
    "start:all": "concurrently \"npm run start:trade-manager-service\" \"npm run start:trade-risk-service\"",
    "stop:trade-manager-service": "pkill -f 'trade-manager-service.*spring-boot:run'",
    "stop:trade-risk-service": "pkill -f 'trade-risk-service.*spring-boot:run'",
    "stop:all": "npm run stop:trade-manager-service && npm run stop:trade-risk-service"
  },
  "dependencies": {
    "concurrently": "^7.0.0"
  },
  "devDependencies": {},
  "author": "",
  "license": "MIT"
}
EOL

# Install npm dependencies
npm install

echo "Maven multi-module project created successfully!"
