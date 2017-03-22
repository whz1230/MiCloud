package com.mi.test;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.DataAccessException;

import com.mi.file.dao.FileDao;
import com.mi.file.vo.FileVo;
import com.mi.util.UUIDGenerator;

public class MainTest {
	private static ApplicationContext ctx;

	@BeforeClass
	public static void before() {
		ctx = new ClassPathXmlApplicationContext("applicationContext.xml");

	}

	@Test
	public void testQueryFile() throws DataAccessException, FileNotFoundException {
		FileDao fileDao = (FileDao) ctx.getBean("fileDao");
		fileDao.queryFileById("1694B3CF1F1848078F61939D5763EEFD", new FileOutputStream(new File("c:/001.jpg")));
	}

	@Test
	public void testSaveFile() throws DataAccessException, FileNotFoundException {
		long start = System.currentTimeMillis();
		FileDao fileDao = (FileDao) ctx.getBean("fileDao");
		String pathname = "";
		List<File> list = getFileList(new File(pathname));
		for (File file : list) {
			FileVo vo = new FileVo();
			file2Vo(file, vo);
			fileDao.saveFile(vo, new FileInputStream(file), (int) file.length());
		}
		long end = System.currentTimeMillis();
		System.out.println("程序运行了" + (end - start) + "毫秒");
	}

	@Test
	public void testSaveFile2() throws DataAccessException, FileNotFoundException {
		FileDao fileDao = (FileDao) ctx.getBean("fileDao");
		fileDao.insertHiber(new FileVo());
	}

	private void file2Vo(File file, FileVo vo) {
		if (file == null || vo == null) {
			return;
		}
		String filename = file.getName();
		int index = filename.lastIndexOf(".");
		vo.setName(filename);
		vo.setServerName(UUIDGenerator.getUUID() + "." + filename.substring(index + 1));
		vo.setType(filename.substring(index + 1));
		vo.setUploadTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
	}

	private List<File> getFileList(File file) {
		List<File> list = new ArrayList<File>();
		File[] files = file.listFiles();
		for (File f : files) {
			if (f.isDirectory()) {
				List<File> list2 = getFileList(f);
				for (File file2 : list2) {
					list.add(file2);
				}
			} else {
				list.add(f);
			}
		}

		return list;
	}
}
