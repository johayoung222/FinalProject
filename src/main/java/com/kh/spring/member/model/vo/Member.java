package com.kh.spring.member.model.vo;

import java.io.Serializable;
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
public class Member implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int seq_member_no;
	private String memberId;
	private String memberPassword;
	private String memberName;
	private String gender;
	private String memberBirth;
	private String memberAddress;	
	private String memberPhone;
	private String memberInterest;
	private String memberAlarm;
	private String memberMilage;
	private String memberMailNo;
	private String memberEmail;
	private String memberIsAdmin;
	private String memberSeller;
	private String memberSnsAccount;
	private String memberReport;
	private String memberStatus;
	private Date memberEnrollDate;
	
}
