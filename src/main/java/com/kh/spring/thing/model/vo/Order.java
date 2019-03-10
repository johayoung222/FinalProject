package com.kh.spring.thing.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Order {
	
	private int seqOrderNo;
	private Date orderDate;
	private int orderPrice;
	private int orderAmount;
	private String orderMethod;
	private String orderEtc;
	private String orderTraceMethod;
	private String orderResult;
	private int orderPoint;
	private String orderCoupon;
	private int seqBasketNo;
	private int seqMemberNo;
	private String merchantUid;
	private String impUid;
	private int seqProductNo;

}
