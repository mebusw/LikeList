package org.likelist.po;

/**
 * EsjAdminAdvertisement entity. @author MyEclipse Persistence Tools
 */

public class EsjAdminAdvertisement implements java.io.Serializable {

	// Fields

	private Integer advertisementId;
	private String subject;
	private String url;
	private String content;

	// Constructors

	/** default constructor */
	public EsjAdminAdvertisement() {
	}

	/** full constructor */
	public EsjAdminAdvertisement(String subject, String url, String content) {
		this.subject = subject;
		this.url = url;
		this.content = content;
	}

	// Property accessors

	public Integer getAdvertisementId() {
		return this.advertisementId;
	}

	public void setAdvertisementId(Integer advertisementId) {
		this.advertisementId = advertisementId;
	}

	public String getSubject() {
		return this.subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}