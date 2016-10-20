package squarize.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import squarize.dao.SQ_buskingDAO;
import squarize.vo.SQ_busking;

public class SQ_buskingAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;
	private SQ_busking SQ_busking;
	private List<SQ_busking> buskingList;

	public String buskingList(){
		System.out.println("SQ_buskingAction의 buskingList");
		buskingList = new ArrayList<>();
		
		SQ_buskingDAO dao = new SQ_buskingDAO();
		buskingList = dao.buskingList();
		System.out.println("ㅋㅋ" + buskingList);
		return SUCCESS;
	}
	
	@Override
	public void setSession(Map<String, Object> arg0) {
		session = arg0;
	}

	public SQ_busking getSQ_busking() {
		return SQ_busking;
	}

	public void setSQ_busking(SQ_busking sQ_busking) {
		SQ_busking = sQ_busking;
	}

	public List<SQ_busking> getBuskingList() {
		return buskingList;
	}

	public void setBuskingList(List<SQ_busking> buskingList) {
		this.buskingList = buskingList;
	}

}
