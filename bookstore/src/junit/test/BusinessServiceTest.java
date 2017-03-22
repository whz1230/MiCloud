package junit.test;

import org.junit.Test;

import cn.itcast.domain.Book;
import cn.itcast.domain.Cart;
import cn.itcast.domain.Category;
import cn.itcast.domain.Order;
import cn.itcast.domain.PageBean;
import cn.itcast.domain.QueryInfo;
import cn.itcast.domain.User;
import cn.itcast.service.impl.BusinessServiceImpl;
import cn.itcast.utils.JdbcUtils;

public class BusinessServiceTest {
	
	private BusinessServiceImpl service = new BusinessServiceImpl();
	
	@Test
	public void testAddCategory(){
		Category c = new Category();
		c.setId("1");
		c.setName("java����");
		c.setDescription("sdsdfsdf");
		service.addCategory(c);
		
		JdbcUtils.commitTransaction();
	}
	
	@Test
	public void testFindCategory(){
		service.findCategory("1");
	}
	
	@Test
	public void testGetAllCategory(){
		service.getAllCategory();
	}
	
	
	@Test
	public void testAddBook(){
		Category c = new Category();
		c.setId("1");
		c.setName("java����");
		c.setDescription("sdsdfsdf");
		
		Book book = new Book();
		book.setAuthor("����");
		book.setCategory(c);
		book.setDescription("sdfsfd");
		book.setId("34323");
		book.setImage("323");
		book.setName("javaweb����");
		book.setPrice(89);
		
		service.addBook(book);
		JdbcUtils.commitTransaction();
	}
	
	@Test
	public void testFindBook(){
		service.findBook("34323");
	}
	
	
	@Test
	public void testPageQuery(){
		
		QueryInfo info = new QueryInfo();
		info.setCurrentpage(1);
		info.setPagesize(3);
		/*info.setQueryname("category_id");
		info.setQueryvalue("1");*/
		
		PageBean bean = service.bookPageQuery(info);
		System.out.println(bean);
	}
	
	
	@Test
	public void testAddUser(){
		User user = new User();
		user.setAddress("aaaa");
		user.setCellphone("2323");
		user.setEmail("aa@sina.com");
		user.setId("1");
		user.setPassword("123");
		user.setPhone("2323");
		user.setUsername("aaa");
		
		service.addUser(user);
		JdbcUtils.commitTransaction();
		
	}
	
	
	@Test
	public void testSaveOrder(){
		
		User user = new User();
		user.setAddress("aaaa");
		user.setCellphone("2323");
		user.setEmail("aa@sina.com");
		user.setId("1");
		user.setPassword("123");
		user.setPhone("2323");
		user.setUsername("aaa");
		
		
		Cart cart = new Cart();
		Book book = new Book();
		book.setAuthor("����");
		book.setCategory(null);
		book.setDescription("sdfsfd");
		book.setId("34323");
		book.setImage("323");
		book.setName("javaweb����");
		book.setPrice(89);
		cart.add(book);
		
		service.saveOrder(cart, user);
		JdbcUtils.commitTransaction();
	}
	
	@Test
	public void testFindOrder(){
		service.findOrder("4b68760f-c879-401c-8b50-c2fcc830866d");
	}
	
}
