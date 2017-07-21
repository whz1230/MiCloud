package com.mi.service;

import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mi.base.service.BaseService;
import com.mi.vo.FileVO;
import com.mi.vo.UserVO;

public interface FileService extends BaseService {
	public void saveFile(final FileVO vo, final InputStream in, final int len) throws DataAccessException;

	public void queryFileById(String id, OutputStream os) throws DataAccessException;

	public List queryFile() throws DataAccessException;

	public Serializable[] insertBatch(List<FileVO> list) throws DataAccessException;

	void saveUser(UserVO vo) throws DataAccessException;
}
