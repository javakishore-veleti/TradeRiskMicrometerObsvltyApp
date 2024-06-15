package org.tmh.platform.monitoring.trades.trade_risk_service.common.dtos;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor
public class TradeDetails implements Serializable {

    private String tradeId;
    private String customerId;
    private String tradeDate;
}

