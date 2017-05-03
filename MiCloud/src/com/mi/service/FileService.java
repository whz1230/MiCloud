package com.mi.service;

import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mi.base.service.BaseService;
import com.mi.vo.FileVo;

public interface FileService extends BaseService {
	public void saveFile(final FileVo vo, final InputStream in, final int len) throws DataAccessException;

	public void queryFileById(String id, OutputStream os) throws DataAccessException;

	public List queryFile() throws DataAccessException;

	public Serializable[] insertBatch(List<FileVo> list) throws DataAccessException;
}
