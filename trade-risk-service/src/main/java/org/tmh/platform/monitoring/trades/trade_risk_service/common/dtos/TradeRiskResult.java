package org.tmh.platform.monitoring.trades.trade_risk_service.common.dtos;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

@Setter
@Getter
@NoArgsConstructor
@Accessors(chain = true)
public class TradeRiskResult implements Serializable {

    private String tradeId;
    private String customerId;
    private String tradingPeriod = "Today";
    private BigDecimal tradeRiskScore = BigDecimal.valueOf(0.0);
    private TradeDetails tradeDetails;
    private long startTime = 0L;
    private long endTime = 0L;
    private long duration = 0L;

    public TradeRiskResult(String tradeId, String customerId, TradeDetails tradeDetails) {
        this.tradeId = tradeId;
        this.customerId = customerId;
        this.tradeDetails = tradeDetails;
    }
}
