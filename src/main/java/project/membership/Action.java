package project.membership;
//클래스들의 다형성 기능 구현을 위한 Action 인터페이스 생성
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
}
