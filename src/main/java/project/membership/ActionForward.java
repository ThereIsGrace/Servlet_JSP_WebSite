package project.membership;
//페이지 이동방식을 지정하기 위한 클래스
public class ActionForward {
	private boolean redirect;
	private String path;
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
