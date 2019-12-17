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
	private int seqMemberNo;
	private String memberId;
	private String memberPassword;
	private String memberName;
	private String gender;
	private String memberBirth;
	private String memberAddress;	
	private String memberAddressDetail;
	private String memberPhone;
	private String memberInterest;
	private String memberAlarm;
	private int memberMileage;
	private String memberMailNo;
	private String memberEmail;
	private String memberIsAdmin;
	private String memberSeller;
	private String memberSnsAccount;
	private String memberReport;
	private String memberStatus;
	private Date memberEnrollDate;
	
	public Member() {}

	public Member(int seqMemberNo, String memberId, String memberPassword, String memberName, String gender,
			String memberBirth, String memberAddress, String memberPhone, String memberInterest, String memberAlarm,
			int memberMileage, String memberMailNo, String memberEmail, String memberIsAdmin, String memberSeller,
			String memberSnsAccount, String memberReport, String memberStatus, Date memberEnrollDate,String memberAddressDetail) {
		super();
		this.seqMemberNo = seqMemberNo;
		this.memberId = memberId;
		this.memberPassword = memberPassword;
		this.memberName = memberName;
		this.gender = gender;
		this.memberBirth = memberBirth;
		this.memberAddress = memberAddress;
		this.memberPhone = memberPhone;
		this.memberInterest = memberInterest;
		this.memberAlarm = memberAlarm;
		this.memberMileage = memberMileage;
		this.memberMailNo = memberMailNo;
		this.memberEmail = memberEmail;
		this.memberIsAdmin = memberIsAdmin;
		this.memberSeller = memberSeller;
		this.memberSnsAccount = memberSnsAccount;
		this.memberReport = memberReport;
		this.memberStatus = memberStatus;
		this.memberEnrollDate = memberEnrollDate;
		this.memberAddressDetail = memberAddressDetail;
	}

	public int getSeqMemberNo() {
		return seqMemberNo;
	}

	public void setSeqMemberNo(int seqMemberNo) {
		this.seqMemberNo = seqMemberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberInterest() {
		return memberInterest;
	}

	public void setMemberInterest(String memberInterest) {
		this.memberInterest = memberInterest;
	}

	public String getMemberAddressDetail() {
		return memberAddressDetail;
	}

	public void setMemberAddressDetail(String memberAddressDetail) {
		this.memberAddressDetail = memberAddressDetail;
	}

	public String getMemberAlarm() {
		return memberAlarm;
	}

	public void setMemberAlarm(String memberAlarm) {
		this.memberAlarm = memberAlarm;
	}

	public int getMemberMileage() {
		return memberMileage;
	}

	public void setMemberMileage(int memberMileage) {
		this.memberMileage = memberMileage;
	}

	public String getMemberMailNo() {
		return memberMailNo;
	}

	public void setMemberMailNo(String memberMailNo) {
		this.memberMailNo = memberMailNo;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberIsAdmin() {
		return memberIsAdmin;
	}

	public void setMemberIsAdmin(String memberIsAdmin) {
		this.memberIsAdmin = memberIsAdmin;
	}

	public String getMemberSeller() {
		return memberSeller;
	}

	public void setMemberSeller(String memberSeller) {
		this.memberSeller = memberSeller;
	}

	public String getMemberSnsAccount() {
		return memberSnsAccount;
	}

	public void setMemberSnsAccount(String memberSnsAccount) {
		this.memberSnsAccount = memberSnsAccount;
	}

	public String getMemberReport() {
		return memberReport;
	}

	public void setMemberReport(String memberReport) {
		this.memberReport = memberReport;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	public Date getMemberEnrollDate() {
		return memberEnrollDate;
	}

	public void setMemberEnrollDate(Date memberEnrollDate) {
		this.memberEnrollDate = memberEnrollDate;
	}

	@Override
	public String toString() {
		return "Member [seqMemberNo=" + seqMemberNo + ", memberId=" + memberId + ", memberPassword=" + memberPassword
				+ ", memberName=" + memberName + ", gender=" + gender + ", memberBirth=" + memberBirth
				+ ", memberAddress=" + memberAddress + ", memberAddressDetail=" + memberAddressDetail + ", memberPhone="
				+ memberPhone + ", memberInterest=" + memberInterest + ", memberAlarm=" + memberAlarm
				+ ", memberMileage=" + memberMileage + ", memberMailNo=" + memberMailNo + ", memberEmail=" + memberEmail
				+ ", memberIsAdmin=" + memberIsAdmin + ", memberSeller=" + memberSeller + ", memberSnsAccount="
				+ memberSnsAccount + ", memberReport=" + memberReport + ", memberStatus=" + memberStatus
				+ ", memberEnrollDate=" + memberEnrollDate + "]";
	}
	
	
	
}
