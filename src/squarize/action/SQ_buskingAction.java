package squarize.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class SQ_buskingAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;
	
	
	
	
	
	
	

	@Override
	public void setSession(Map<String, Object> arg0) {
		session = arg0;
	}

}
