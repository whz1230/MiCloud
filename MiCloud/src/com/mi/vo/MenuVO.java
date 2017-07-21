package com.mi.vo;

import java.io.Serializable;

public class MenuVO implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;
	private String parentId;
	private String menuName;
	private String menuUrl;
	private String menuIcon;
	private String delete;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	public String getMenuIcon() {
		return menuIcon;
	}

	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}

	public String getDelete() {
		return delete;
	}

	public void setDelete(String delete) {
		this.delete = delete;
	}

	@Override
	public String toString() {
		return "MenuVO [id=" + id + ", parentId=" + parentId + ", menuName=" + menuName + ", menuUrl=" + menuUrl + ", menuIcon=" + menuIcon + ", delete=" + delete + "]";
	}

}
