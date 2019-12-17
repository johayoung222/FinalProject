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
	
	public Order() {}

	public Order(int seqOrderNo, Date orderDate, int orderPrice, int orderAmount, String orderMethod, String orderEtc,
			String orderTraceMethod, String orderResult, int orderPoint, String orderCoupon, int seqBasketNo,
			int seqMemberNo, String merchantUid, String impUid, int seqProductNo) {
		super();
		this.seqOrderNo = seqOrderNo;
		this.orderDate = orderDate;
		this.orderPrice = orderPrice;
		this.orderAmount = orderAmount;
		this.orderMethod = orderMethod;
		this.orderEtc = orderEtc;
		this.orderTraceMethod = orderTraceMethod;
		this.orderResult = orderResult;
		this.orderPoint = orderPoint;
		this.orderCoupon = orderCoupon;
		this.seqBasketNo = seqBasketNo;
		this.seqMemberNo = seqMemberNo;
		this.merchantUid = merchantUid;
		this.impUid = impUid;
		this.seqProductNo = seqProductNo;
	}

	public int getSeqOrderNo() {
		return seqOrderNo;
	}

	public void setSeqOrderNo(int seqOrderNo) {
		this.seqOrderNo = seqOrderNo;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public int getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getOrderMethod() {
		return orderMethod;
	}

	public void setOrderMethod(String orderMethod) {
		this.orderMethod = orderMethod;
	}

	public String getOrderEtc() {
		return orderEtc;
	}

	public void setOrderEtc(String orderEtc) {
		this.orderEtc = orderEtc;
	}

	public String getOrderTraceMethod() {
		return orderTraceMethod;
	}

	public void setOrderTraceMethod(String orderTraceMethod) {
		this.orderTraceMethod = orderTraceMethod;
	}

	public String getOrderResult() {
		return orderResult;
	}

	public void setOrderResult(String orderResult) {
		this.orderResult = orderResult;
	}

	public int getOrderPoint() {
		return orderPoint;
	}

	public void setOrderPoint(int orderPoint) {
		this.orderPoint = orderPoint;
	}

	public String getOrderCoupon() {
		return orderCoupon;
	}

	public void setOrderCoupon(String orderCoupon) {
		this.orderCoupon = orderCoupon;
	}

	public int getSeqBasketNo() {
		return seqBasketNo;
	}

	public void setSeqBasketNo(int seqBasketNo) {
		this.seqBasketNo = seqBasketNo;
	}

	public int getSeqMemberNo() {
		return seqMemberNo;
	}

	public void setSeqMemberNo(int seqMemberNo) {
		this.seqMemberNo = seqMemberNo;
	}

	public String getMerchantUid() {
		return merchantUid;
	}

	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}

	public String getImpUid() {
		return impUid;
	}

	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}

	public int getSeqProductNo() {
		return seqProductNo;
	}

	public void setSeqProductNo(int seqProductNo) {
		this.seqProductNo = seqProductNo;
	}
	
	

}
