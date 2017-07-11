package com.mi.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.LobRetrievalFailureException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.jdbc.core.support.AbstractLobCreatingPreparedStatementCallback;
import org.springframework.jdbc.core.support.AbstractLobStreamingResultSetExtractor;
import org.springframework.jdbc.support.lob.LobCreator;
import org.springframework.jdbc.support.lob.LobHandler;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import com.mi.base.service.impl.BaseServiceImpl;
import com.mi.service.FileService;
import com.mi.util.UUIDGenerator;
import com.mi.vo.FileVo;

@Service("fileService")
public class FileServiceImpl extends BaseServiceImpl implements FileService {
	@Resource
	private LobHandler lobHandler;
	@Resource
	private JdbcTemplate jdbcTemplate;



	@Override
	public void saveFile(final FileVo vo, final InputStream in, final int len) throws DataAccessException {
		final String sql = "INSERT INTO T_FILE(ID, FILENAME, SERVERNAME, TYPE, DESCRIPTION, UPLOADTIME, FILEDATA) VALUES(?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.execute(sql, new AbstractLobCreatingPreparedStatementCallback(this.lobHandler) {
			protected void setValues(PreparedStatement ps, LobCreator lobCreator) throws SQLException {
				ps.setString(1, UUIDGenerator.getUUID());
				ps.setString(2, vo.getFileName());
				ps.setString(3, vo.getServerName());
				ps.setString(4, vo.getType());
				ps.setString(5, vo.getDescription());
				ps.setString(6, new SimpleDateFormat("yyyy-MM-dd HH:ss:mm").format(new Date()));
				lobCreator.setBlobAsBinaryStream(ps, 7, in, len);
			}
		});
	}

	@Override
	public void queryFileById(final String id, final OutputStream os) throws DataAccessException {
		final String sql = "SELECT FILEDATA FROM T_FILE WHERE ID = ?";
		jdbcTemplate.query(sql, new Object[] { id }, new AbstractLobStreamingResultSetExtractor() {
			protected void handleNoRowFound() throws LobRetrievalFailureException {
				throw new EmptyResultDataAccessException("file with id '" + id + "' not found in database", 1);
			}

			public void streamData(ResultSet rs) throws SQLException, IOException {
				InputStream is = lobHandler.getBlobAsBinaryStream(rs, 1);
				if (is != null) {
					FileCopyUtils.copy(is, os);
				}
			}
		});

	}

	@Override
	public Serializable[] insertBatch(List<FileVo> list) throws DataAccessException {

		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<FileVo> queryFile() throws DataAccessException {
		final String sql = "SELECT ID, FILENAME, SERVERNAME, TYPE, DESCRIPTION, UPLOADTIME FROM T_FILE";
		return jdbcTemplate.query(sql, new ParameterizedRowMapper<FileVo>() {
			public FileVo mapRow(ResultSet rs, int rowNum) throws SQLException {
				FileVo vo = new FileVo();
				vo.setId(rs.getString(1));
				vo.setFileName(rs.getString(2));
				vo.setServerName(rs.getString(3));
				vo.setType(rs.getString(4));
				vo.setDescription(rs.getString(5));
				vo.setUploadTime(rs.getString(6));
				return vo;
			}
		});
	}

}
