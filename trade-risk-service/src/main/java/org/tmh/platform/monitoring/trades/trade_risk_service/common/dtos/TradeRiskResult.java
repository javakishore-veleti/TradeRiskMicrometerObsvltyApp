package org.tmh.platform.monitoring.trades.trade_risk_service.common.dtos;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.math.BigDecimal;

@Setter
@Getter
@NoArgsConstructor
public class TradeRiskResult implements Serializable {

    private String tradeId;
    private String customerId;
    private String tradingPeriod = "Today";
    private BigDecimal tradeRiskScore = BigDecimal.valueOf(0.0);
    private TradeDetails tradeDetails;

    public TradeRiskResult(String tradeId, String customerId, TradeDetails tradeDetails) {
        this.tradeId = tradeId;
        this.customerId = customerId;
        this.tradeDetails = tradeDetails;
    }
}
