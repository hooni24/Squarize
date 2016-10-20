package squarize.vo;

public class SQ_recruit_apply {
	
	private int sq_recruit_apply_id;
	private int sq_recruit_id;
	private String sq_member_id;
	public int getSq_recruit_apply_id() {
		return sq_recruit_apply_id;
	}
	public void setSq_recruit_apply_id(int sq_recruit_apply_id) {
		this.sq_recruit_apply_id = sq_recruit_apply_id;
	}
	public int getSq_recruit_id() {
		return sq_recruit_id;
	}
	public void setSq_recruit_id(int sq_recruit_id) {
		this.sq_recruit_id = sq_recruit_id;
	}
	public String getSq_member_id() {
		return sq_member_id;
	}
	public void setSq_member_id(String sq_member_id) {
		this.sq_member_id = sq_member_id;
	}
	@Override
	public String toString() {
		return "SQ_recruit_apply [sq_recruit_apply_id=" + sq_recruit_apply_id + ", sq_recruit_id=" + sq_recruit_id
				+ ", sq_member_id=" + sq_member_id + "]";
	}
	
	
	
}
