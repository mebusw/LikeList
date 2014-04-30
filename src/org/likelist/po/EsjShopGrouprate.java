package org.likelist.po;

import java.util.Date;

/**
 * EsjShopGrouprate entity. @author MyEclipse Persistence Tools
 */

public class EsjShopGrouprate implements java.io.Serializable {

	// Fields

	private Integer grouprateId;
	private Integer bizId;
	private Integer shopId;
	private Date createTime;
	private String subject;
	private String content;
	private float curPrice;
	private float origPrice;
	private Integer percent;
	private Date timeFrom;
	private Date timeTo;
	private Integer maxMember;
	private Integer minMember;
	private String imagePath;
	private boolean approved;
	private Date lastUpdate;

	// Constructors

	/** default constructor */
	public EsjShopGrouprate() {
	}

	/** minimal constructor */
	public EsjShopGrouprate(Integer bizId, Integer shopId, Date createTime,
			boolean approved, Date lastUpdate) {
		this.bizId = bizId;
		this.shopId = shopId;
		this.createTime = createTime;
		this.approved = approved;
		this.lastUpdate = lastUpdate;
	}

	/** full constructor */
	public EsjShopGrouprate(Integer bizId, Integer shopId, Date createTime,
			String subject, String content, float curPrice, float origPrice,
			Integer percent, Date timeFrom, Date timeTo, Integer maxMember,
			Integer minMember, String imagePath, boolean approved,
			Date lastUpdate) {
		this.bizId = bizId;
		this.shopId = shopId;
		this.createTime = createTime;
		this.subject = subject;
		this.content = content;
		this.curPrice = curPrice;
		this.origPrice = origPrice;
		this.percent = percent;
		this.timeFrom = timeFrom;
		this.timeTo = timeTo;
		this.maxMember = maxMember;
		this.minMember = minMember;
		this.imagePath = imagePath;
		this.approved = approved;
		this.lastUpdate = lastUpdate;
	}

	// Property accessors

	public Integer getGrouprateId() {
		return this.grouprateId;
	}

	public void setGrouprateId(Integer grouprateId) {
		this.grouprateId = grouprateId;
	}

	public Integer getBizId() {
		return this.bizId;
	}

	public void setBizId(Integer bizId) {
		this.bizId = bizId;
	}

	public Integer getShopId() {
		return this.shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getSubject() {
		return this.subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public float getCurPrice() {
		return this.curPrice;
	}

	public void setCurPrice(float curPrice) {
		this.curPrice = curPrice;
	}

	public float getOrigPrice() {
		return this.origPrice;
	}

	public void setOrigPrice(float origPrice) {
		this.origPrice = origPrice;
	}

	public Integer getPercent() {
		return this.percent;
	}

	public void setPercent(Integer percent) {
		this.percent = percent;
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

	public Integer getMaxMember() {
		return this.maxMember;
	}

	public void setMaxMember(Integer maxMember) {
		this.maxMember = maxMember;
	}

	public Integer getMinMember() {
		return this.minMember;
	}

	public void setMinMember(Integer minMember) {
		this.minMember = minMember;
	}

	public String getImagePath() {
		return this.imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public boolean getApproved() {
		return this.approved;
	}

	public void setApproved(boolean approved) {
		this.approved = approved;
	}

	public Date getLastUpdate() {
		return this.lastUpdate;
	}

	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

}