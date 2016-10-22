package squarize.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import squarize.dao.SQ_seekingDAO;
import squarize.vo.SQ_portfolio;
import squarize.vo.SQ_recruit;
import squarize.vo.SQ_recruit_artist;
import squarize.vo.SQ_rent;

public class SQ_seekingAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;

	//seeking 페이지에서 썸네일로 뿌릴 list멤버
//	private JsonObject json_object;
	private List<SQ_recruit> sq_recruit_list;
	private List<SQ_rent> sq_rent_list;
	private List<SQ_portfolio> sq_portfolio_list;


	private SQ_recruit_artist sq_recruit_artist;

	private SQ_recruit sq_recruit;

//	private String loginId=(String)session.get("loginId");

	private String loginId;

	

	
	//SQ_seekingAction 기본 생성자
	public SQ_seekingAction(){
		System.out.println("SQ_seekingAction 생성 및 멤버초기화 됨.");	//후에 삭제
	}
	
	//구인정보리스트
	public String selectAll_SQ_recruit(){
		System.out.println("구인정보 리스트 갖고오기 - Action");
		SQ_seekingDAO dao = new SQ_seekingDAO();
		sq_recruit_list = (List<SQ_recruit>)dao.selectAll_sq_recruit();
		System.out.println("recruit_list : "+sq_recruit_list);
		return SUCCESS;
	}
	
	//구인 상세정보
	public String selectOne_SQ_recruit_artist(){
		System.out.println("구인 상세정보 갖고오기 - Action : " + sq_recruit_artist.getSq_recruit_id());
		SQ_seekingDAO dao = new SQ_seekingDAO();
		sq_recruit_artist = dao.selectOne_sq_recruit_artist(sq_recruit_artist.getSq_recruit_id());
		System.out.println("recruit_detail : " + sq_recruit_artist);
		return SUCCESS;
	}

	/**
	 * insertSQrecruit()
	 * 구인정보 등록 
	 * @param sq_recruit
	 * @return success
	 * */
	public String insertSQrecruit(){
//		System.out.println(loginId);
		return SUCCESS;
	}
	
	//멤버의 getter & setter
	@Override
	public void setSession(Map<String, Object> arg0) {
		session = arg0;
	}

	public List<SQ_recruit> getSq_recruit_list() {
		return sq_recruit_list;
	}

	public void setSq_recruit_list(List<SQ_recruit> sq_recruit_list) {
		this.sq_recruit_list = sq_recruit_list;
	}

	public List<SQ_rent> getSq_rent_list() {
		return sq_rent_list;
	}

	public void setSq_rent_list(List<SQ_rent> sq_rent_list) {
		this.sq_rent_list = sq_rent_list;
	}

	public List<SQ_portfolio> getSq_portfolio_list() {
		return sq_portfolio_list;
	}

	public void setSq_portfolio_list(List<SQ_portfolio> sq_portfolio_list) {
		this.sq_portfolio_list = sq_portfolio_list;
	}

	public SQ_recruit getSq_recruit() {
		return sq_recruit;
	}

	public void setSq_recruit(SQ_recruit sq_recruit) {
		this.sq_recruit = sq_recruit;
	}

	public SQ_recruit_artist getSq_recruit_artist() {
		return sq_recruit_artist;
	}

	public void setSq_recruit_artist(SQ_recruit_artist sq_recruit_artist) {
		this.sq_recruit_artist = sq_recruit_artist;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

}
