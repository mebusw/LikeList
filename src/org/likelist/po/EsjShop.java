package org.likelist.po;

import java.util.Date;

/**
 * EsjShop entity. @author MyEclipse Persistence Tools
 */

public class EsjShop implements java.io.Serializable {

	// Fields

	private Integer shopId;
	private String shopName;
	private String shopPwd;
	private String shopEmail;
	private boolean approved;
	private String shopPhone;
	private String shopAvatarPath;
	private Integer addressId;
	private Integer bizId;
	private String website;
	private Integer albumId;
	private Integer adminSpecifyGrade;
	private Integer shopLiked;
	private Integer shopTried;
	private Integer shopShared;
	private Integer shopPurchased;
	private boolean likedByMe;
	private Integer shopVisited;
	private Integer shopForwarded;
	private Integer shopCommented;
	private String country;
	private String province;
	private String city;
	private String district;
	private String street;
	private String fullAddress;
	private Integer zipCode;
	private float longitude;
	private float latitude;
	private Integer level;
	private String category1;
	private String category2;
	private String category3;
	private Date createTime;
	private Date lastUpdate;
	private String description;
	private boolean triedByMe;
	private Date dealPublishExpire;

	// Constructors

	/** default constructor */
	public EsjShop() {
	}

	/** minimal constructor */
	public EsjShop(String shopName, String shopPwd, String shopEmail,
			boolean approved, String shopPhone, Integer bizId, Date createTime,
			Date lastUpdate) {
		this.shopName = shopName;
		this.shopPwd = shopPwd;
		this.shopEmail = shopEmail;
		this.approved = approved;
		this.shopPhone = shopPhone;
		this.bizId = bizId;
		this.createTime = createTime;
		this.lastUpdate = lastUpdate;
	}

	/** full constructor */
	public EsjShop(String shopName, String shopPwd, String shopEmail,
			boolean approved, String shopPhone, String shopAvatarPath,
			Integer addressId, Integer bizId, String website, Integer albumId,
			Integer adminSpecifyGrade, Integer shopLiked, Integer shopTried,
			Integer shopShared, Integer shopPurchased, boolean likedByMe,
			Integer shopVisited, Integer shopForwarded, Integer shopCommented,
			String country, String province, String city, String district,
			String street, String fullAddress, Integer zipCode,
			float longitude, float latitude, Integer level, String category1,
			String category2, String category3, Date createTime,
			Date lastUpdate, String description, boolean triedByMe,
			Date dealPublishExpire) {
		this.shopName = shopName;
		this.shopPwd = shopPwd;
		this.shopEmail = shopEmail;
		this.approved = approved;
		this.shopPhone = shopPhone;
		this.shopAvatarPath = shopAvatarPath;
		this.addressId = addressId;
		this.bizId = bizId;
		this.website = website;
		this.albumId = albumId;
		this.adminSpecifyGrade = adminSpecifyGrade;
		this.shopLiked = shopLiked;
		this.shopTried = shopTried;
		this.shopShared = shopShared;
		this.shopPurchased = shopPurchased;
		this.likedByMe = likedByMe;
		this.shopVisited = shopVisited;
		this.shopForwarded = shopForwarded;
		this.shopCommented = shopCommented;
		this.country = country;
		this.province = province;
		this.city = city;
		this.district = district;
		this.street = street;
		this.fullAddress = fullAddress;
		this.zipCode = zipCode;
		this.longitude = longitude;
		this.latitude = latitude;
		this.level = level;
		this.category1 = category1;
		this.category2 = category2;
		this.category3 = category3;
		this.createTime = createTime;
		this.lastUpdate = lastUpdate;
		this.description = description;
		this.triedByMe = triedByMe;
		this.dealPublishExpire = dealPublishExpire;
	}

	// Property accessors

	public Integer getShopId() {
		return this.shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public String getShopName() {
		return this.shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getShopPwd() {
		return this.shopPwd;
	}

	public void setShopPwd(String shopPwd) {
		this.shopPwd = shopPwd;
	}

	public String getShopEmail() {
		return this.shopEmail;
	}

	public void setShopEmail(String shopEmail) {
		this.shopEmail = shopEmail;
	}

	public boolean getApproved() {
		return this.approved;
	}

	public void setApproved(boolean approved) {
		this.approved = approved;
	}

	public String getShopPhone() {
		return this.shopPhone;
	}

	public void setShopPhone(String shopPhone) {
		this.shopPhone = shopPhone;
	}

	public String getShopAvatarPath() {
		return this.shopAvatarPath;
	}

	public void setShopAvatarPath(String shopAvatarPath) {
		this.shopAvatarPath = shopAvatarPath;
	}

	public Integer getAddressId() {
		return this.addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public Integer getBizId() {
		return this.bizId;
	}

	public void setBizId(Integer bizId) {
		this.bizId = bizId;
	}

	public String getWebsite() {
		return this.website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public Integer getAlbumId() {
		return this.albumId;
	}

	public void setAlbumId(Integer albumId) {
		this.albumId = albumId;
	}

	public Integer getAdminSpecifyGrade() {
		return this.adminSpecifyGrade;
	}

	public void setAdminSpecifyGrade(Integer adminSpecifyGrade) {
		this.adminSpecifyGrade = adminSpecifyGrade;
	}

	public Integer getShopLiked() {
		return this.shopLiked;
	}

	public void setShopLiked(Integer shopLiked) {
		this.shopLiked = shopLiked;
	}

	public Integer getShopTried() {
		return this.shopTried;
	}

	public void setShopTried(Integer shopTried) {
		this.shopTried = shopTried;
	}

	public Integer getShopShared() {
		return this.shopShared;
	}

	public void setShopShared(Integer shopShared) {
		this.shopShared = shopShared;
	}

	public Integer getShopPurchased() {
		return this.shopPurchased;
	}

	public void setShopPurchased(Integer shopPurchased) {
		this.shopPurchased = shopPurchased;
	}

	public boolean getLikedByMe() {
		return this.likedByMe;
	}

	public void setLikedByMe(boolean likedByMe) {
		this.likedByMe = likedByMe;
	}

	public Integer getShopVisited() {
		return this.shopVisited;
	}

	public void setShopVisited(Integer shopVisited) {
		this.shopVisited = shopVisited;
	}

	public Integer getShopForwarded() {
		return this.shopForwarded;
	}

	public void setShopForwarded(Integer shopForwarded) {
		this.shopForwarded = shopForwarded;
	}

	public Integer getShopCommented() {
		return this.shopCommented;
	}

	public void setShopCommented(Integer shopCommented) {
		this.shopCommented = shopCommented;
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

	public Integer getZipCode() {
		return this.zipCode;
	}

	public void setZipCode(Integer zipCode) {
		this.zipCode = zipCode;
	}

	public float getLongitude() {
		return this.longitude;
	}

	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}

	public float getLatitude() {
		return this.latitude;
	}

	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}

	public Integer getLevel() {
		return this.level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getCategory1() {
		return this.category1;
	}

	public void setCategory1(String category1) {
		this.category1 = category1;
	}

	public String getCategory2() {
		return this.category2;
	}

	public void setCategory2(String category2) {
		this.category2 = category2;
	}

	public String getCategory3() {
		return this.category3;
	}

	public void setCategory3(String category3) {
		this.category3 = category3;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getLastUpdate() {
		return this.lastUpdate;
	}

	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean getTriedByMe() {
		return this.triedByMe;
	}

	public void setTriedByMe(boolean triedByMe) {
		this.triedByMe = triedByMe;
	}

	public Date getDealPublishExpire() {
		return this.dealPublishExpire;
	}

	public void setDealPublishExpire(Date dealPublishExpire) {
		this.dealPublishExpire = dealPublishExpire;
	}

}