package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Service
public class loginInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		try {
			HttpSession session = request.getSession();
			
			
			if (session.getAttribute("auth") == null) {
				
				response.sendRedirect("/view/login/pagelogin");

				return false;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return true;
	}
}
