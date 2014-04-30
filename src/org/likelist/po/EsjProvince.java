package org.likelist.po;

import java.util.Date;

/**
 * EsjProvince entity. @author MyEclipse Persistence Tools
 */

public class EsjProvince implements java.io.Serializable {

	// Fields

	private Integer provinceId;
	private String provinceName;
	private Date dateCreated;
	private Date dateUpdated;

	// Constructors

	/** default constructor */
	public EsjProvince() {
	}

	/** minimal constructor */
	public EsjProvince(String provinceName) {
		this.provinceName = provinceName;
	}

	/** full constructor */
	public EsjProvince(String provinceName, Date dateCreated, Date dateUpdated) {
		this.provinceName = provinceName;
		this.dateCreated = dateCreated;
		this.dateUpdated = dateUpdated;
	}

	// Property accessors

	public Integer getProvinceId() {
		return this.provinceId;
	}

	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}

	public String getProvinceName() {
		return this.provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public Date getDateCreated() {
		return this.dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public Date getDateUpdated() {
		return this.dateUpdated;
	}

	public void setDateUpdated(Date dateUpdated) {
		this.dateUpdated = dateUpdated;
	}

}