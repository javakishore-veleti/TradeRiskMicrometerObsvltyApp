package org.tmh.platform.monitoring.trades.trade_risk_service.api.controllers;

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

    @GetMapping("/api/traderisk/{tradeId}")
    @CrossOrigin(origins = "*")
    public ResponseEntity<TradeRiskResult> getTradeRisk(@PathVariable String tradeId) {
        TradeDetails tradeDetails = restTemplate.getForObject("http://localhost:9080/api/trades/" + tradeId, TradeDetails.class);
        // Mock implementation, replace with actual risk evaluation logic
        return ResponseEntity.ok(new TradeRiskResult(tradeId, tradeId, tradeDetails));
    }
}
