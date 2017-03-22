package junit.test;

import org.junit.Test;

import cn.itcast.dao.BookDao;
import cn.itcast.dao.impl.BookDaoImpl;
import cn.itcast.domain.Book;
import cn.itcast.domain.Category;
import cn.itcast.utils.JdbcUtils;

public class BookDaoTest {
	
	@Test
	public void testQuery(){
		
		BookDao dao = new BookDaoImpl();
		dao.pageQuery(0, 2, "", 1);
	}
	
	@Test
	public void addBook(){
		
		Book book = new Book();
		book.setAuthor("aaa");
		book.setDescription("fff");
		book.setId("4");
		book.setImage("4");
		book.setName("4444");
		book.setPrice(90);
		book.setCategory(new Category());
		BookDao dao = new BookDaoImpl();
		dao.add(book);
		
		
		JdbcUtils.commitTransaction();
		
	}
	
}
