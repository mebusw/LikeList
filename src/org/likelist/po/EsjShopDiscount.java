package org.likelist.po;

import java.util.Date;

/**
 * EsjShopDiscount entity. @author MyEclipse Persistence Tools
 */

public class EsjShopDiscount implements java.io.Serializable {

	// Fields

	private Integer shopDiscountId;
	private String imagePath;
	private String subject;
	private Integer percent;
	private String content;
	private Date timeFrom;
	private Date timeTo;
	private Date createTime;
	private boolean approved;
	private Integer shopId;
	private Integer bizId;
	private Date lastUpdate;

	// Constructors

	/** default constructor */
	public EsjShopDiscount() {
	}

	/** minimal constructor */
	public EsjShopDiscount(Date createTime, boolean approved, Integer shopId,
			Integer bizId, Date lastUpdate) {
		this.createTime = createTime;
		this.approved = approved;
		this.shopId = shopId;
		this.bizId = bizId;
		this.lastUpdate = lastUpdate;
	}

	/** full constructor */
	public EsjShopDiscount(String imagePath, String subject, Integer percent,
			String content, Date timeFrom, Date timeTo, Date createTime,
			boolean approved, Integer shopId, Integer bizId, Date lastUpdate) {
		this.imagePath = imagePath;
		this.subject = subject;
		this.percent = percent;
		this.content = content;
		this.timeFrom = timeFrom;
		this.timeTo = timeTo;
		this.createTime = createTime;
		this.approved = approved;
		this.shopId = shopId;
		this.bizId = bizId;
		this.lastUpdate = lastUpdate;
	}

	// Property accessors

	public Integer getShopDiscountId() {
		return this.shopDiscountId;
	}

	public void setShopDiscountId(Integer shopDiscountId) {
		this.shopDiscountId = shopDiscountId;
	}

	public String getImagePath() {
		return this.imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getSubject() {
		return this.subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Integer getPercent() {
		return this.percent;
	}

	public void setPercent(Integer percent) {
		this.percent = percent;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getTimeFrom() {
		return this.timeFrom;
	}

	public void setTimeFrom(Date timeFrom) {
		this.timeFrom = timeFrom;
	}

	public Date getTimeTo() {
		return this.timeTo;
	}

	public void setTimeTo(Date timeTo) {
		this.timeTo = timeTo;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public boolean getApproved() {
		return this.approved;
	}

	public void setApproved(boolean approved) {
		this.approved = approved;
	}

	public Integer getShopId() {
		return this.shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public Integer getBizId() {
		return this.bizId;
	}

	public void setBizId(Integer bizId) {
		this.bizId = bizId;
	}

	public Date getLastUpdate() {
		return this.lastUpdate;
	}

	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

}