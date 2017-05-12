package com.mi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ImageController {
	
	public String list(){
		
		return "/jsp/file/fileList.jsp";
	}
}
