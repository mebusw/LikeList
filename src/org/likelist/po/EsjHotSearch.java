package org.likelist.po;

/**
 * EsjHotSearch entity. @author MyEclipse Persistence Tools
 */

public class EsjHotSearch implements java.io.Serializable {

	// Fields

	private Integer hotSearchId;
	private String keyword;
	private Integer searchTimes;
	private Integer userId;

	// Constructors

	/** default constructor */
	public EsjHotSearch() {
	}

	/** full constructor */
	public EsjHotSearch(String keyword, Integer searchTimes, Integer userId) {
		this.keyword = keyword;
		this.searchTimes = searchTimes;
		this.userId = userId;
	}

	// Property accessors

	public Integer getHotSearchId() {
		return this.hotSearchId;
	}

	public void setHotSearchId(Integer hotSearchId) {
		this.hotSearchId = hotSearchId;
	}

	public String getKeyword() {
		return this.keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getSearchTimes() {
		return this.searchTimes;
	}

	public void setSearchTimes(Integer searchTimes) {
		this.searchTimes = searchTimes;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}