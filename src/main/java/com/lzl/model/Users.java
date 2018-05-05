package com.lzl.model;

import java.io.Serializable;
import java.util.Date;


/**
 * 用户实体类
 * @author Administrator
 *
 */
public class Users implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String cardId;
	
	private String name;

	private Integer gender;
	
	private Date createTime;
	
	private String password;
	
	private Integer status;

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Users [cardId=" + cardId + ", name=" + name + ", gender=" + gender + ", createTime=" + createTime
				+ ", password=" + password + ", status=" + status + "]";
	}
	
	
}
