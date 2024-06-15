package org.tmh.platform.monitoring.trades.trade_manager_service.api.controllers;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.tmh.platform.monitoring.trades.trade_manager_service.common.dtos.TradeDetails;

@RestController
public class TradeController {

    @GetMapping("/api/trades/{tradeId}")
    @CrossOrigin(origins = "*")
    public TradeDetails getTradeDetails(@PathVariable String tradeId) {
        // Mock implementation, replace with actual logic
        return new TradeDetails(tradeId);
    }
}
