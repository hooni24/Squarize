package squarize.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import squarize.dao.SQ_memberDAO;
import squarize.vo.SQ_member;

public class SQ_memberAction extends ActionSupport implements SessionAware{
	private SQ_memberDAO mdao;
	private Map<String, Object> session;
	private SQ_member sq_member;
	private String sq_member_id;
	private String sq_member_pw;
	private String loginId;
	private String isArtist;

	
	
	public String idCheck() throws Exception{
		mdao=new SQ_memberDAO();
		sq_member=mdao.loginSQmember(sq_member_id);
		return SUCCESS;
	}
	
	public String registerSQmember() throws Exception{
		mdao=new SQ_memberDAO();
		mdao.registerSQmember(sq_member);
		return SUCCESS;
	}
	
	public String loginSQmember() throws Exception{
		mdao=new SQ_memberDAO();
		sq_member=mdao.loginSQmember(sq_member_id);
		
		if(sq_member.getSq_member_pw().equals(sq_member_pw)){
			session.put("loginId", sq_member.getSq_member_id());
			session.put("isArtist", sq_member.getSq_member_isartist());
			loginId=(String) session.get("loginId");
			isArtist=(String) session.get("isArtist");
		}else{
			sq_member=null;
			loginId="";
			isArtist="";
		}
		return SUCCESS;
	}
	
	public String loginCheck() throws Exception{
		loginId=(String)session.get("loginId");
		isArtist=(String)session.get("isArtist");
		System.out.println(isArtist);
		return SUCCESS;
	}
	
	public String logoutSQmember() throws Exception{
		session.clear();
		return SUCCESS;
	}
	
	
	
	
	
	
	public SQ_member getSq_member() {
		return sq_member;
	}
	public void setSq_member(SQ_member sq_member) {
		this.sq_member = sq_member;
	}
	public String getSq_member_id() {
		return sq_member_id;
	}
	public void setSq_member_id(String sq_member_id) {
		this.sq_member_id = sq_member_id;
	}	
	public String getSq_member_pw() {
		return sq_member_pw;
	}
	public void setSq_member_pw(String sq_member_pw) {
		this.sq_member_pw = sq_member_pw;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getIsArtist() {
		return isArtist;
	}
	public void setIsArtist(String isArtist) {
		this.isArtist = isArtist;
	}
	@Override
	public void setSession(Map<String, Object> arg0) {
		session = arg0;
	}
	
	
}
