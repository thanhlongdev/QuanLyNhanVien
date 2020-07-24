package poly.intercepsor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerIntercepsor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") == null) {
			session.setAttribute("message", "Login is requied");
			response.sendRedirect(request.getContextPath()+"/login/index.htm");
			return false;
		}
		return true;

	}
	
}
