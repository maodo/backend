package com.atosorigin.mice.km.vo;

import java.io.Serializable;

public class VenueCategoryVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 9171940476278964391L;
	private String id;
	private String description;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	

}
