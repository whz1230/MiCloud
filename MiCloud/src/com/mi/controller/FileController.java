package com.mi.controller;

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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mi.service.FileService;
import com.mi.util.UUIDGenerator;
import com.mi.vo.FileVO;
import com.mi.vo.MenuVO;
import com.mi.vo.UserVO;

@Controller
public class FileController {

	@Autowired
	FileService service;

	@RequestMapping("/file/list.do")
	public String list(Model model) {
		model.addAttribute("list", service.queryFile());
		return "/video.jsp";
	}
	
	
	@RequestMapping("/file/fileData.do")
	public void fileData(HttpServletRequest request, HttpServletResponse response) throws DataAccessException, IOException {
		service.queryFileById(request.getParameter("id"), response.getOutputStream());
	}

	@RequestMapping("/file/saveFile.do")
	public void saveFile() {
		String filePath = "E:\\mi_files";

		FileInputStream in = null;
		FileOutputStream out = null;

		List<File> list = showAllFiles(new File(filePath));
		FileVO vo = null;
		for (File f : list) {
			try {
				String fileName = f.getName();
				String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
				if (!ext.equalsIgnoreCase("mp3")) {
					continue;
				}

				String uuid = UUIDGenerator.getUUID();

				in = new FileInputStream(f);
				int len = (int) f.length();

				vo = new FileVO();
				vo.setId(UUIDGenerator.getUUID());
				vo.setFileName(fileName);
				vo.setServerName(uuid + "." + ext);
				vo.setType(ext);
				vo.setUploadTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
				vo.setDescription(fileName);
				System.out.println(vo);

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
	
	@RequestMapping("/user/saveUser.do")
	public String saveUser(){
		UserVO vo = new UserVO();
		vo.setId(UUIDGenerator.getUUID());
		vo.setCreateDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		service.insertHiber(vo);
		
		MenuVO menuVO = new MenuVO();
		menuVO.setId(UUIDGenerator.getUUID());
		service.insertHiber(menuVO);
		
		FileVO fileVO = new FileVO();
		fileVO.setId(UUIDGenerator.getUUID());
		service.insertHiber(fileVO);
	
		return null;
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
