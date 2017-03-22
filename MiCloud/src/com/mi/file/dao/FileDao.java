package com.mi.file.dao;

import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mi.base.dao.Mediator;
import com.mi.file.vo.FileVo;

public interface FileDao extends Mediator {
	
	public void saveFile(final FileVo vo, final InputStream in, final int len) throws DataAccessException;

	public void queryFileById(String id, OutputStream os) throws DataAccessException;

	public List queryFile() throws DataAccessException;
	
	public Serializable[] insertBatch(List<FileVo> list) throws DataAccessException;
}
