package com.mi.tree.web;

import javax.annotation.Resource;
import javax.persistence.criteria.From;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mi.tree.dao.CategoryDao;
import com.mi.tree.vo.Category;

@Controller
public class ListTreeController {

	@Resource
	private CategoryDao categoryDao;

	@RequestMapping("/tree/list.do")
	public String list(Model model) {
		model.addAttribute("list", categoryDao.queryAll());
		return "/jsp/tree/treeList.jsp";
	}

	@RequestMapping("/tree/queryById.do")
	public String queryById(Model model, String id) {
		model.addAttribute("c", categoryDao.getHiber(Category.class, id));
		return "/jsp/tree/treeList.jsp";
	}

}
