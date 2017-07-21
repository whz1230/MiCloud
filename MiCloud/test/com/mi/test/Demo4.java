package com.mi.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.junit.Test;

import com.mi.service.FileService;
import com.mi.service.impl.FileServiceImpl;
import com.mi.util.UUIDGenerator;
import com.mi.vo.FileVO;

public class Demo4 {


	@Test
	public void insertImage() {

		String src = "f:/src/image";
		String target = "C:\\tomcat6\\webapps\\MI\\upload\\image";

		FileInputStream in = null;
		FileOutputStream out = null;

		List<File> list = showAllFiles(new File(src));
		FileVO vo = null;
		for (File f : list) {
			try {
				String name = f.getName();
				String ext = name.substring(name.lastIndexOf(".") + 1);

				String uuid = UUIDGenerator.getUUID();
				String path = generateSavePath();
				String dir = target + "/" + path;
				File file = new File(dir);
				if (!file.exists()) {
					file.mkdirs();
				}
				String serverPath = target + "\\" + path + "\\" + uuid + "." + ext;

				in = new FileInputStream(f);
				out = new FileOutputStream(new File(serverPath));
				int len = 0;
				byte[] buffer = new byte[1024];
				while ((len = in.read(buffer)) != -1) {
					out.write(buffer, 0, len);
				}

				vo = new FileVO();
				vo.setId(UUIDGenerator.getUUID());
				vo.setFileName(name);
				vo.setServerName(uuid + "." + ext);
				vo.setUploadTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
				vo.setDescription(name);
				System.out.println(vo);

				FileService service = new FileServiceImpl();
				service.saveFile(vo, in, len);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					if (in != null) {
						in.close();
					}

					if (out != null) {
						out.close();
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}

	}

	private static String generateRelativePath() {
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1;
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		return year + "/" + month + "/" + day;
	}

	private static String generateSavePath() {
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1;
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		return year + "\\" + month + "\\" + day;
	}

	public final static List<File> showAllFiles(File file) {
		List<File> list = new ArrayList<File>();

		File[] fs = file.listFiles();
		list.addAll(Arrays.asList(fs));
		for (int i = 0; i < fs.length; i++) {
			if (fs[i].isDirectory()) {
				try {
					list.addAll(showAllFiles(fs[i]));
				} catch (Exception e) {
				}
			}
		}

		return list;
	}
}
