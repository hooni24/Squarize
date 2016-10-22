package squarize.vo;

public class SQ_rent_apply {
	private String sq_rent_apply_id;
	private String sq_rent_id;
	private String sq_member_id;
	
	public SQ_rent_apply() {}

	public String getSq_rent_apply_id() {
		return sq_rent_apply_id;
	}

	public void setSq_rent_apply_id(String sq_rent_apply_id) {
		this.sq_rent_apply_id = sq_rent_apply_id;
	}

	public String getSq_rent_id() {
		return sq_rent_id;
	}

	public void setSq_rent_id(String sq_rent_id) {
		this.sq_rent_id = sq_rent_id;
	}

	public String getSq_member_id() {
		return sq_member_id;
	}

	public void setSq_member_id(String sq_member_id) {
		this.sq_member_id = sq_member_id;
	}

	@Override
	public String toString() {
		return "SQ_rent_apply [sq_rent_apply_id=" + sq_rent_apply_id + ", sq_rent_id=" + sq_rent_id + ", sq_member_id="
				+ sq_member_id + "]";
	}
	
	

}
