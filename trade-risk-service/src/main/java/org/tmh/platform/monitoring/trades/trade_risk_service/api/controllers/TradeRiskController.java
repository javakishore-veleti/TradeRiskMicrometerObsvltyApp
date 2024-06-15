package org.tmh.platform.monitoring.trades.trade_risk_service.api.controllers;

import io.micrometer.core.instrument.MeterRegistry;
import io.micrometer.core.instrument.Timer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.tmh.platform.monitoring.trades.trade_risk_service.common.dtos.TradeDetails;
import org.tmh.platform.monitoring.trades.trade_risk_service.common.dtos.TradeRiskResult;

@RestController
public class TradeRiskController {

    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    private MeterRegistry meterRegistry;

    @GetMapping("/api/traderisk/{tradeId}")
    @CrossOrigin(origins = "*")
    public ResponseEntity<TradeRiskResult> getTradeRisk(@PathVariable String tradeId) {
        long start = System.currentTimeMillis();

        TradeDetails tradeDetails = restTemplate.getForObject("http://localhost:9080/api/trades/" + tradeId, TradeDetails.class);
        // Mock implementation, replace with actual risk evaluation logic

        long end = System.currentTimeMillis();
        long duration = end - start;

        // Option 1: Simple Approach Record the time taken to process the request
        meterRegistry.timer("tradeRiskQuery.time").record(() -> {
            return duration;
        });

        // Option 2: Metadata Enriched Approach Record the time taken to process the request with tradeId as a tag
        Timer.builder("tradeRiskQuery.time")
                .tag("tradeId", tradeId)
                .description("Time taken to get trade risk " + tradeId)
                .register(meterRegistry)
                .record(duration, java.util.concurrent.TimeUnit.MILLISECONDS);

        return ResponseEntity.ok(new TradeRiskResult(tradeId, tradeId, tradeDetails).setStartTime(start).setEndTime(end).setDuration(duration));
    }
}
