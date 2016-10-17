package squarize.action;

import com.opensymphony.xwork2.ActionSupport;

import squarize.vo.SQ_member;

public class SQ_memberAction extends ActionSupport{
	private SQ_member sq_member;
	private String sq_member_id;
	
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
	
	public String registerSQmember(){
		System.out.println(sq_member);
		return SUCCESS;
	}
	public String loginSQmember(){
		
		return SUCCESS;
	}
	
	
}
