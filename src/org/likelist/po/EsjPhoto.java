package org.likelist.po;

import java.util.Date;

/**
 * EsjPhoto entity. @author MyEclipse Persistence Tools
 */

public class EsjPhoto implements java.io.Serializable {

	// Fields

	private Integer photoId;
	private String largePath;
	private String smallPath;
	private String description;
	private Integer albumId;
	private Date createTime;
	private Integer size;

	// Constructors

	/** default constructor */
	public EsjPhoto() {
	}

	/** minimal constructor */
	public EsjPhoto(String largePath, Integer albumId, Date createTime) {
		this.largePath = largePath;
		this.albumId = albumId;
		this.createTime = createTime;
	}

	/** full constructor */
	public EsjPhoto(String largePath, String smallPath, String description,
			Integer albumId, Date createTime, Integer size) {
		this.largePath = largePath;
		this.smallPath = smallPath;
		this.description = description;
		this.albumId = albumId;
		this.createTime = createTime;
		this.size = size;
	}

	// Property accessors

	public Integer getPhotoId() {
		return this.photoId;
	}

	public void setPhotoId(Integer photoId) {
		this.photoId = photoId;
	}

	public String getLargePath() {
		return this.largePath;
	}

	public void setLargePath(String largePath) {
		this.largePath = largePath;
	}

	public String getSmallPath() {
		return this.smallPath;
	}

	public void setSmallPath(String smallPath) {
		this.smallPath = smallPath;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

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

	public Integer getSize() {
		return this.size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

}