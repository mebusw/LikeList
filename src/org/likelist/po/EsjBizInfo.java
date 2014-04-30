package org.likelist.po;

import java.util.Date;

/**
 * EsjBizInfo entity. @author MyEclipse Persistence Tools
 */

public class EsjBizInfo implements java.io.Serializable {

	// Fields

	private Integer bizId;
	private String alipayAccount;
	private String fullName;
	private String password;
	private String identifyCard;
	private String firstName;
	private String midName;
	private String lastName;
	private boolean approved;
	private String phone;
	private String email;
	private Integer bizAddrId;
	private Date createTime;
	private String country;
	private String province;
	private String city;
	private String district;
	private String street;
	private String fullAddress;
	private Date lastUpdate;
	private Date lastLogin;

	// Constructors

	/** default constructor */
	public EsjBizInfo() {
	}

	/** minimal constructor */
	public EsjBizInfo(String fullName, String password, String firstName,
			String midName, String lastName, boolean approved, String email,
			Date createTime, Date lastUpdate) {
		this.fullName = fullName;
		this.password = password;
		this.firstName = firstName;
		this.midName = midName;
		this.lastName = lastName;
		this.approved = approved;
		this.email = email;
		this.createTime = createTime;
		this.lastUpdate = lastUpdate;
	}

	/** full constructor */
	public EsjBizInfo(String alipayAccount, String fullName, String password,
			String identifyCard, String firstName, String midName,
			String lastName, boolean approved, String phone, String email,
			Integer bizAddrId, Date createTime, String country,
			String province, String city, String district, String street,
			String fullAddress, Date lastUpdate, Date lastLogin) {
		this.alipayAccount = alipayAccount;
		this.fullName = fullName;
		this.password = password;
		this.identifyCard = identifyCard;
		this.firstName = firstName;
		this.midName = midName;
		this.lastName = lastName;
		this.approved = approved;
		this.phone = phone;
		this.email = email;
		this.bizAddrId = bizAddrId;
		this.createTime = createTime;
		this.country = country;
		this.province = province;
		this.city = city;
		this.district = district;
		this.street = street;
		this.fullAddress = fullAddress;
		this.lastUpdate = lastUpdate;
		this.lastLogin = lastLogin;
	}

	// Property accessors

	public Integer getBizId() {
		return this.bizId;
	}

	public void setBizId(Integer bizId) {
		this.bizId = bizId;
	}

	public String getAlipayAccount() {
		return this.alipayAccount;
	}

	public void setAlipayAccount(String alipayAccount) {
		this.alipayAccount = alipayAccount;
	}

	public String getFullName() {
		return this.fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getIdentifyCard() {
		return this.identifyCard;
	}

	public void setIdentifyCard(String identifyCard) {
		this.identifyCard = identifyCard;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMidName() {
		return this.midName;
	}

	public void setMidName(String midName) {
		this.midName = midName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public boolean getApproved() {
		return this.approved;
	}

	public void setApproved(boolean approved) {
		this.approved = approved;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getBizAddrId() {
		return this.bizAddrId;
	}

	public void setBizAddrId(Integer bizAddrId) {
		this.bizAddrId = bizAddrId;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getProvince() {
		return this.province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistrict() {
		return this.district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getStreet() {
		return this.street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getFullAddress() {
		return this.fullAddress;
	}

	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
	}

	public Date getLastUpdate() {
		return this.lastUpdate;
	}

	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public Date getLastLogin() {
		return this.lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

}