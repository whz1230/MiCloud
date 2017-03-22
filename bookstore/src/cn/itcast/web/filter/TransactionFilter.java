package cn.itcast.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import cn.itcast.utils.JdbcUtils;

public class TransactionFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		//index.jsp   dao   dao    
		//1.jpg
		try{
			//���������󣺻�ȡ���ӡ��������񡢲������Ӱ󶨵���ǰ�߳�
			//JdbcUtils.StartTransaction();   //JdbcUtils.getConnection();
			
			chain.doFilter(request, response);  //Ŀ����Դִ�� dao1   conn =  JdbcUtils.getConnection();   dao2   JdbcUtils.getConnection()
			
			//��ȡ��ǰ�߳��ϰ󶨵����ӣ��ύ���񣬲��ر����ӣ��ͷ������뵱ǰ�̵߳İ�
			JdbcUtils.commitTransaction();
		}finally{
			JdbcUtils.closeConn();
		}
	
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

}
