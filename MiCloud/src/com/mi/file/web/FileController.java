package com.mi.file.web;

import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mi.file.dao.FileDao;

@Controller
public class FileController {
	@Resource
	FileDao fileDao;

	@RequestMapping("/file/list.do")
	private String list(Model model) {
		List list = fileDao.queryFile();
		model.addAttribute("list", list);

		return "/jsp/file/fileList.jsp";

	}

	@RequestMapping("/file/fileDate.do")
	public void getFileDate(String id,OutputStream out) {
		fileDao.queryFileById(id, out);
	}
	
	@RequestMapping("/file/view.do")
	public String view(String id) {
		
		return "/jsp/file/viewImage.jsp?id=" + id;
	}

}
