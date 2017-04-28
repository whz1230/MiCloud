package com.mi.vo;

import java.io.Serializable;
import java.util.Arrays;

public class FileVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;
	private String name;
	private String serverName;
	private String type;
	private String descrition;
	private String uploadTime;
	private byte[] fileData;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getServerName() {
		return serverName;
	}

	public void setServerName(String serverName) {
		this.serverName = serverName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescrition() {
		return descrition;
	}

	public void setDescrition(String descrition) {
		this.descrition = descrition;
	}

	public String getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}

	public byte[] getFileData() {
		return fileData;
	}

	public void setFileData(byte[] fileData) {
		this.fileData = fileData;
	}

	@Override
	public String toString() {
		return "FileVo [id=" + id + ", name=" + name + ", serverName=" + serverName + ", type=" + type + ", descrition=" + descrition + ", uploadTime=" + uploadTime
				+ ", fileData=" + Arrays.toString(fileData) + "]";
	}

}
