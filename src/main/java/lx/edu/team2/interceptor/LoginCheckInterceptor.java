package lx.edu.team2.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lx.edu.team2.dao.MemDAO;
import lx.edu.team2.vo.MemVO;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	MemDAO memDao;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		MemVO vo  = (MemVO) session.getAttribute("memVo");
		if(vo==null) {
			response.sendRedirect("login-form.do");
			return false;
		} else {
			String memId = vo.memId;
			if(memId==null||memId.equals("")) {
				response.sendRedirect("login-form.do");
				return false;
			}
		} 
		return true;
	}
}
