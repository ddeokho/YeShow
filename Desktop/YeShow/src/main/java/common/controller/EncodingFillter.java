package common.controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class EncodingFillter
 */
@WebFilter("/*")//WEBFILLTER
public class EncodingFillter implements Filter {

    /**
     * Default constructor. 
     */
    public EncodingFillter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//request�� ������ ���� ���� ó���� �ڵ尡 �ִٸ�
		//�� ������ �����Ѵ�.
		//���� request�� ���� �Ŀ� ���� ó���� �ڵ尡 �ִٸ�
		//���� ���⼭ �����Ѵ�.
		//�츮�� ��� ��û ó���Ǳ� ���� �ѱ� ���ڵ�
		//ó���� ���Ϳ��� �� ����
		
		request.setCharacterEncoding("UTF-8");
		//System.out.println("�ѱ�ó�� ó���߾��");
		
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
