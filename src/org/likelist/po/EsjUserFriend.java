package org.likelist.po;

import java.util.Date;


/**
 * EsjUserFriend entity. @author MyEclipse Persistence Tools
 */

public class EsjUserFriend  implements java.io.Serializable {


    // Fields    

     private Integer friendshipId;
     private Integer userId;
     private Integer friendId;
     private Integer state;
     private Date createTime;
     private String note;


    // Constructors

    /** default constructor */
    public EsjUserFriend() {
    }

	/** minimal constructor */
    public EsjUserFriend(Integer userId, Integer friendId, Integer state, Date createTime) {
        this.userId = userId;
        this.friendId = friendId;
        this.state = state;
        this.createTime = createTime;
    }
    
    /** full constructor */
    public EsjUserFriend(Integer userId, Integer friendId, Integer state, Date createTime, String note) {
        this.userId = userId;
        this.friendId = friendId;
        this.state = state;
        this.createTime = createTime;
        this.note = note;
    }

   
    // Property accessors

    public Integer getFriendshipId() {
        return this.friendshipId;
    }
    
    public void setFriendshipId(Integer friendshipId) {
        this.friendshipId = friendshipId;
    }

    public Integer getUserId() {
        return this.userId;
    }
    
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getFriendId() {
        return this.friendId;
    }
    
    public void setFriendId(Integer friendId) {
        this.friendId = friendId;
    }

    public Integer getState() {
        return this.state;
    }
    
    public void setState(Integer state) {
        this.state = state;
    }

    public Date getCreateTime() {
        return this.createTime;
    }
    
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getNote() {
        return this.note;
    }
    
    public void setNote(String note) {
        this.note = note;
    }
   








}