package spring.utility.muzik;
 
import java.io.IOException;
 
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
 
public class AdminLoginCheckFilter implements Filter {
 
    public void init(FilterConfig arg0) throws ServletException {
    }
 
    public void doFilter(ServletRequest request, ServletResponse response, 
            FilterChain chain)
    throws IOException, ServletException {
        
        // Filter�� ��û �߰����� request ��ü�� �����մϴ�.
        HttpServletRequest httpRequest = (HttpServletRequest)request;
 
        // ���ο� ������ ���������ʰ� request ��ü���� ������ ���� ��ȯ
        HttpSession session = httpRequest.getSession(false);
        
        // �α��� ���� �ʾҴٰ� ����
        boolean login = false;
        
        if (session != null) { // session ��ü�� �����Ǿ� �ִ��� Ȯ��
            // �α����� �����鼭 ���������� Ȯ���մϴ�.
            if (session.getAttribute("id") != null 
                    && session.getAttribute("grade").equals("A")) {
                login = true;  // �����ڶ��
            }
        }
        
        // ���������� �α����� �Ǿ��ٸ� ��û �������� �̵��մϴ�.
        if (login) {
            chain.doFilter(request, response); //��û �������� �̵�
        } else {
            // �α����� �ȵǾ��ٸ� �α��� �������� �̵�
            RequestDispatcher dispatcher = 
                request.getRequestDispatcher("/member/login");
            dispatcher.forward(request, response);
        }
    }
 
    public void destroy() {
    }
}
 