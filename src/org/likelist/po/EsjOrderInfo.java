package org.likelist.po;

import java.util.Date;

/**
 * EsjOrderInfo entity. @author MyEclipse Persistence Tools
 */

public class EsjOrderInfo implements java.io.Serializable {

	// Fields

	private Integer orderId;
	private Integer buyerId;
	private Integer productType;
	private Integer shopId;
	private Integer productId;
	private String subject;
	private String buyerAliAccount;
	private float price;
	private Date createTime;
	private Integer quantify;
	private String body;
	private String showUrl;
	private String royaltyAccount;
	private String exterInvokerIp;
	private boolean paid;
	private Date notifyTime;
	private boolean consumed;
	private Date consumeTime;
	private String extraCommonParam;
	private String buyerPhone;
	private String code;
	private Integer reserved;

	// Constructors

	/** default constructor */
	public EsjOrderInfo() {
	}

	/** minimal constructor */
	public EsjOrderInfo(Integer buyerId, Integer productType, Integer shopId,
			Integer productId, float price, Date createTime, boolean paid,
			String buyerPhone) {
		this.buyerId = buyerId;
		this.productType = productType;
		this.shopId = shopId;
		this.productId = productId;
		this.price = price;
		this.createTime = createTime;
		this.paid = paid;
		this.buyerPhone = buyerPhone;
	}

	/** full constructor */
	public EsjOrderInfo(Integer buyerId, Integer productType, Integer shopId,
			Integer productId, String subject, String buyerAliAccount,
			float price, Date createTime, Integer quantify, String body,
			String showUrl, String royaltyAccount, String exterInvokerIp,
			boolean paid, Date notifyTime, boolean consumed, Date consumeTime,
			String extraCommonParam, String buyerPhone, String code,
			Integer reserved) {
		this.buyerId = buyerId;
		this.productType = productType;
		this.shopId = shopId;
		this.productId = productId;
		this.subject = subject;
		this.buyerAliAccount = buyerAliAccount;
		this.price = price;
		this.createTime = createTime;
		this.quantify = quantify;
		this.body = body;
		this.showUrl = showUrl;
		this.royaltyAccount = royaltyAccount;
		this.exterInvokerIp = exterInvokerIp;
		this.paid = paid;
		this.notifyTime = notifyTime;
		this.consumed = consumed;
		this.consumeTime = consumeTime;
		this.extraCommonParam = extraCommonParam;
		this.buyerPhone = buyerPhone;
		this.code = code;
		this.reserved = reserved;
	}

	// Property accessors

	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getBuyerId() {
		return this.buyerId;
	}

	public void setBuyerId(Integer buyerId) {
		this.buyerId = buyerId;
	}

	public Integer getProductType() {
		return this.productType;
	}

	public void setProductType(Integer productType) {
		this.productType = productType;
	}

	public Integer getShopId() {
		return this.shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public Integer getProductId() {
		return this.productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getSubject() {
		return this.subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBuyerAliAccount() {
		return this.buyerAliAccount;
	}

	public void setBuyerAliAccount(String buyerAliAccount) {
		this.buyerAliAccount = buyerAliAccount;
	}

	public float getPrice() {
		return this.price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getQuantify() {
		return this.quantify;
	}

	public void setQuantify(Integer quantify) {
		this.quantify = quantify;
	}

	public String getBody() {
		return this.body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getShowUrl() {
		return this.showUrl;
	}

	public void setShowUrl(String showUrl) {
		this.showUrl = showUrl;
	}

	public String getRoyaltyAccount() {
		return this.royaltyAccount;
	}

	public void setRoyaltyAccount(String royaltyAccount) {
		this.royaltyAccount = royaltyAccount;
	}

	public String getExterInvokerIp() {
		return this.exterInvokerIp;
	}

	public void setExterInvokerIp(String exterInvokerIp) {
		this.exterInvokerIp = exterInvokerIp;
	}

	public boolean getPaid() {
		return this.paid;
	}

	public void setPaid(boolean paid) {
		this.paid = paid;
	}

	public Date getNotifyTime() {
		return this.notifyTime;
	}

	public void setNotifyTime(Date notifyTime) {
		this.notifyTime = notifyTime;
	}

	public boolean getConsumed() {
		return this.consumed;
	}

	public void setConsumed(boolean consumed) {
		this.consumed = consumed;
	}

	public Date getConsumeTime() {
		return this.consumeTime;
	}

	public void setConsumeTime(Date consumeTime) {
		this.consumeTime = consumeTime;
	}

	public String getExtraCommonParam() {
		return this.extraCommonParam;
	}

	public void setExtraCommonParam(String extraCommonParam) {
		this.extraCommonParam = extraCommonParam;
	}

	public String getBuyerPhone() {
		return this.buyerPhone;
	}

	public void setBuyerPhone(String buyerPhone) {
		this.buyerPhone = buyerPhone;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getReserved() {
		return this.reserved;
	}

	public void setReserved(Integer reserved) {
		this.reserved = reserved;
	}

}