package org.likelist.po;

import java.util.Date;

/**
 * EsjCity entity. @author MyEclipse Persistence Tools
 */

public class EsjCity implements java.io.Serializable {

	// Fields

	private Integer cityId;
	private String cityName;
	private String zipCode;
	private Integer provinceId;
	private Date dateCreated;
	private Date dateUpdated;

	// Constructors

	/** default constructor */
	public EsjCity() {
	}

	/** minimal constructor */
	public EsjCity(String cityName, String zipCode) {
		this.cityName = cityName;
		this.zipCode = zipCode;
	}

	/** full constructor */
	public EsjCity(String cityName, String zipCode, Integer provinceId,
			Date dateCreated, Date dateUpdated) {
		this.cityName = cityName;
		this.zipCode = zipCode;
		this.provinceId = provinceId;
		this.dateCreated = dateCreated;
		this.dateUpdated = dateUpdated;
	}

	// Property accessors

	public Integer getCityId() {
		return this.cityId;
	}

	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}

	public String getCityName() {
		return this.cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getZipCode() {
		return this.zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public Integer getProvinceId() {
		return this.provinceId;
	}

	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
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