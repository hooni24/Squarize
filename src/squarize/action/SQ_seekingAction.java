package squarize.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import squarize.dao.SQ_seekingDAO;
import squarize.vo.SQ_portfolio;
import squarize.vo.SQ_recruit;
import squarize.vo.SQ_rent;

public class SQ_seekingAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;

	//seeking 페이지에서 썸네일로 뿌릴 list멤버
	private ArrayList<SQ_recruit> sq_recruit_list;
	private ArrayList<SQ_rent> sq_rent_list;
	private ArrayList<SQ_portfolio> sq_portfolio_list;
	
	
	//SQ_seekingAction 기본 생성자
	public SQ_seekingAction(){
		System.out.println("SQ_seekingAction 생성 및 멤버초기화 됨.");	//후에 삭제
	}
	
	//구인정보리스트
	public String selectAll_SQ_recruit(){
		SQ_seekingDAO dao = new SQ_seekingDAO();
		sq_recruit_list = (ArrayList<SQ_recruit>)dao.selectAll_sq_recruit();
		System.out.println("구인정보 리스트 액션!");
		System.out.println(sq_recruit_list);
		return SUCCESS;
	}

	
	//멤버의 getter & setter
	@Override
	public void setSession(Map<String, Object> arg0) {
		session = arg0;
	}

	public ArrayList<SQ_recruit> getSq_recruit_list() {
		return sq_recruit_list;
	}

	public void setSq_recruit_list(ArrayList<SQ_recruit> sq_recruit_list) {
		this.sq_recruit_list = sq_recruit_list;
	}

	public ArrayList<SQ_rent> getSq_rent_list() {
		return sq_rent_list;
	}

	public void setSq_rent_list(ArrayList<SQ_rent> sq_rent_list) {
		this.sq_rent_list = sq_rent_list;
	}

	public ArrayList<SQ_portfolio> getSq_portfolio_list() {
		return sq_portfolio_list;
	}

	public void setSq_portfolio_list(ArrayList<SQ_portfolio> sq_portfolio_list) {
		this.sq_portfolio_list = sq_portfolio_list;
	}

}
