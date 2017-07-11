package com.mi.vo;

import java.io.Serializable;
import java.util.Arrays;

public class FileVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;
	private String fileName;
	private String serverName;
	private String type;
	private String description;
	private String uploadTime;
	private byte[] fileData;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
		return "FileVo [id=" + id + ", fileName=" + fileName + ", serverName=" + serverName + ", type=" + type + ", description=" + description + ", uploadTime=" + uploadTime
				+ ", fileData=" + Arrays.toString(fileData) + "]";
	}

}
