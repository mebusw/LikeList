package org.likelist.po;

import java.util.Date;

/**
 * EsjAlbum entity. @author MyEclipse Persistence Tools
 */

public class EsjAlbum implements java.io.Serializable {

	// Fields

	private Integer albumId;
	private Date createTime;
	private String albumName;
	private Integer albumType;
	private Integer coverPhotoId;
	private String description;
	private Integer ownerId;

	// Constructors

	/** default constructor */
	public EsjAlbum() {
	}

	/** minimal constructor */
	public EsjAlbum(Date createTime, Integer albumType, Integer ownerId) {
		this.createTime = createTime;
		this.albumType = albumType;
		this.ownerId = ownerId;
	}

	/** full constructor */
	public EsjAlbum(Date createTime, String albumName, Integer albumType,
			Integer coverPhotoId, String description, Integer ownerId) {
		this.createTime = createTime;
		this.albumName = albumName;
		this.albumType = albumType;
		this.coverPhotoId = coverPhotoId;
		this.description = description;
		this.ownerId = ownerId;
	}

	// Property accessors

	public Integer getAlbumId() {
		return this.albumId;
	}

	public void setAlbumId(Integer albumId) {
		this.albumId = albumId;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getAlbumName() {
		return this.albumName;
	}

	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}

	public Integer getAlbumType() {
		return this.albumType;
	}

	public void setAlbumType(Integer albumType) {
		this.albumType = albumType;
	}

	public Integer getCoverPhotoId() {
		return this.coverPhotoId;
	}

	public void setCoverPhotoId(Integer coverPhotoId) {
		this.coverPhotoId = coverPhotoId;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getOwnerId() {
		return this.ownerId;
	}

	public void setOwnerId(Integer ownerId) {
		this.ownerId = ownerId;
	}

}